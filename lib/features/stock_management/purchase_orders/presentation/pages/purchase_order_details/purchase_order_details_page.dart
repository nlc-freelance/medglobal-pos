import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_order_details.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderDetailsPage extends StatefulWidget {
  const PurchaseOrderDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<PurchaseOrderDetailsPage> createState() => _PurchaseOrderDetailsPageState();
}

class _PurchaseOrderDetailsPageState extends State<PurchaseOrderDetailsPage> {
  late PurchaseOrder _purchaseOrder;

  @override
  void initState() {
    super.initState();
    context.read<PurchaseOrderRemoteCubit>().getProductById(int.parse(widget.id));
  }

  String get _title {
    switch (_purchaseOrder.status) {
      case StockActionStatus.NEW:
        return 'Edit Purchase Order';
      case StockActionStatus.FOR_RECEIVING:
        return 'Receive Purchase Order';
      case StockActionStatus.COMPLETED || StockActionStatus.CANCELLED:
        return 'Purchase Order Details';
      default:
        return Strings.empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseOrderRemoteCubit, PurchaseOrderRemoteState>(
      listener: (context, state) {
        if (state is PurchaseOrderByIdSuccess) {
          _purchaseOrder = state.purchaseOrder;
          context.read<PurchaseOrderCubit>().setPurchaseOrder(state.purchaseOrder);
        }
        if (state is PurchaseOrderSuccess) {
          AppRouter.router.pushReplacementNamed(SideMenuTreeItem.PURCHASE_ORDERS.name);
          ToastNotification.success(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is PurchaseOrderByIdError) {
          return Text(state.message);
        }
        if (state is PurchaseOrderByIdLoading) {
          return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: _title,
              subtitle: Strings.subtitlePlaceholder,
              titleTrailings: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Chip(
                    label: Text(
                      _purchaseOrder.status!.label,
                      style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(_purchaseOrder.status!)),
                    ),
                    backgroundColor: StatusMapper.color(_purchaseOrder.status!),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: UIColors.transparent),
                    ),
                  ),
                ),
                const UIHorizontalSpace(12),
                if (_purchaseOrder.status == StockActionStatus.NEW ||
                    _purchaseOrder.status == StockActionStatus.FOR_RECEIVING)
                  UIPopupMenuButton.icon(
                    onSelect: (menu) {
                      if (menu == 'Cancel Purchase Order') {
                        context.read<PurchaseOrderRemoteCubit>().update(
                              PurchaseOrderUpdate.CANCEL,
                              id: _purchaseOrder.id!,
                              purchaseOrder: _purchaseOrder,
                            );
                      }
                    },
                    icon: Assets.icons.more.setSize(20),
                    menu: const ['Cancel Purchase Order', 'Delete Purchase Order'],
                    menuAsString: (menu) => menu,
                  ),
                if (state is PurchaseOrderCancelLoading) ...[
                  const UIHorizontalSpace(12),
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                  ),
                ],
              ],
            ),
            if (_purchaseOrder.status == StockActionStatus.NEW ||
                _purchaseOrder.status == StockActionStatus.FOR_RECEIVING) ...[
              UIText.heading5(
                  _purchaseOrder.status == StockActionStatus.NEW ? 'Step 2 of 4 - Editing' : 'Step 3 of 4 - Receiving'),
              const UIVerticalSpace(12),
              if (_purchaseOrder.status == StockActionStatus.NEW) const PurchaseOrderStepper(currentStep: 1),
              if (_purchaseOrder.status == StockActionStatus.FOR_RECEIVING) const PurchaseOrderStepper(currentStep: 2)
            ] else
              const Expanded(
                child: SingleChildScrollView(
                  child: PurchaseOrderDetails(),
                ),
              )
          ],
        );
      },
    );
  }
}
