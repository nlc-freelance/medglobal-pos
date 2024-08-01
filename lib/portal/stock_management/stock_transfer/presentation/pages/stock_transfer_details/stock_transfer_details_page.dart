import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/stock_transfer_details.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/stock_transfer_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTransferDetailsPage extends StatefulWidget {
  const StockTransferDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<StockTransferDetailsPage> createState() => _StockTransferDetailsPageState();
}

class _StockTransferDetailsPageState extends State<StockTransferDetailsPage> {
  late StockTransfer _stockTransfer;

  @override
  void initState() {
    super.initState();
    context.read<StockTransferRemoteCubit>().getStockTransferById(int.parse(widget.id));
  }

  String get _title {
    switch (_stockTransfer.status) {
      case StockOrderStatus.NEW:
        return 'Edit Stock Transfer';
      case StockOrderStatus.SHIPPED:
        return 'Confirm Stock Transfer';
      case StockOrderStatus.COMPLETED || StockOrderStatus.CANCELLED:
        return 'Stock Transfer Details';
      default:
        return Strings.empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockTransferRemoteCubit, StockTransferRemoteState>(
      listener: (context, state) {
        if (state is StockTransferByIdSuccess) {
          _stockTransfer = state.stockTransfer;
          context.read<StockTransferCubit>().setStockTransfer(state.stockTransfer);
        }
        if (state is StockTransferSuccess) {
          AppRouter.router.pushReplacementNamed(SideMenuTreeItem.STOCK_TRANSFERS.name);
          ToastNotification.success(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is StockTransferByIdError) {
          return Text(state.message);
        }
        if (state is StockTransferByIdLoading) {
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
                      _stockTransfer.status!.label,
                      style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(_stockTransfer.status!)),
                    ),
                    backgroundColor: StatusMapper.color(_stockTransfer.status!),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: UIColors.transparent),
                    ),
                  ),
                ),
                const UIHorizontalSpace(12),
                if (_stockTransfer.status == StockOrderStatus.NEW)
                  UIPopupMenuButton.icon(
                    onSelect: (menu) {
                      if (menu == 'Cancel Stock Transfer') {
                        context.read<StockTransferRemoteCubit>().update(
                              StockOrderUpdate.CANCEL,
                              id: _stockTransfer.id!,
                              stockTransfer: _stockTransfer,
                            );
                      }
                    },
                    icon: Assets.icons.more.setSize(20),
                    menu: const ['Cancel Stock Transfer'],
                    menuAsString: (menu) => menu,
                  ),
                if (state is StockTransferCancelLoading) ...[
                  const UIHorizontalSpace(12),
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                  ),
                ],
              ],
            ),

            if (_stockTransfer.status == StockOrderStatus.NEW || _stockTransfer.status == StockOrderStatus.SHIPPED) ...[
              UIText.heading5(
                  _stockTransfer.status == StockOrderStatus.NEW ? 'Step 2 of 4 - Editing' : 'Step 3 of 4 - Shipped'),
              const UIVerticalSpace(12),
              if (_stockTransfer.status == StockOrderStatus.NEW) const StockTransferStepper(currentStep: 1),
              if (_stockTransfer.status == StockOrderStatus.SHIPPED) const StockTransferStepper(currentStep: 2)
            ] else
              const Expanded(
                child: SingleChildScrollView(
                  child: StockTransferDetails(),
                ),
              ),

            /// If Status is 'New'
            // UIText.heading5('Step 2 of 4 - Editing'),
            // const UIVerticalSpace(12),
            // const StockTransferStepper(currentStep: 1),

            /// If status is 'Completed'/'Cancelled'
            // const Expanded(
            //   child: SingleChildScrollView(
            //     child: ItemsTransferredDataGrid(),
            //   ),
            // )
          ],
        );
      },
    );
  }
}
