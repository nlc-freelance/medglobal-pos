import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/print_util.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/bloc/purchase_order_bloc/purchase_order_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_order_details.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderDetailsPage extends StatefulWidget {
  const PurchaseOrderDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<PurchaseOrderDetailsPage> createState() => _PurchaseOrderDetailsPageState();
}

class _PurchaseOrderDetailsPageState extends State<PurchaseOrderDetailsPage> {
  // late PurchaseOrder _purchaseOrder;

  @override
  void initState() {
    super.initState();

    final id = int.parse(widget.id);
    context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.getPurchaseOrderById(id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseOrderBloc, PurchaseOrderState>(
      listener: (context, state) => state.maybeWhen(
        loaded: (po) => context.read<PurchaseOrderFormCubit>().loadPurchaseOrder(po),
        updated: (po) => _onSuccess(po),
        deleted: () => _onDeleted(),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      // {
      //   if (state is PurchaseOrderByIdSuccess) {
      //     _purchaseOrder = state.purchaseOrder;
      //     context.read<PurchaseOrderCubit>().setPurchaseOrder(state.purchaseOrder);
      //   }
      //   if (state is PurchaseOrderSuccess) {
      //     _purchaseOrder = state.purchaseOrder;
      //     context.read<PurchaseOrderCubit>().setPurchaseOrder(state.purchaseOrder);
      //     ToastNotification.success(context, 'Purchase Order updated successfully.');
      //   }
      //   if (state is PurchaseOrderDeleteSuccess) {
      //     AppRouter.router.pushReplacementNamed(SideMenuTreeItem.PURCHASE_ORDERS.name);
      //     ToastNotification.success(context, 'Purchase Order deleted successfully.');
      //   }
      // },
      // buildWhen: (prev, curr) => prev.maybeWhen(
      //   updating: () => curr.maybeWhen(
      //     failure: (_) => true,
      //     orElse: () => false,
      //   ),
      //   orElse: () => true,
      // ),
      builder: (context, state) => state.maybeWhen(
        loading: () => const LoadingView(),
        loaded: (po) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: _title(po.status!),
              titleTrailings: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Chip(
                    label: Text(
                      po.status!.label,
                      style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(po.status!)),
                    ),
                    backgroundColor: StatusMapper.color(po.status!),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: UIColors.transparent),
                    ),
                  ),
                ),
                const UIHorizontalSpace(12),
                if (po.status == StockOrderStatus.NEW ||
                    po.status == StockOrderStatus.FOR_RECEIVING ||
                    po.status == StockOrderStatus.COMPLETED)
                  UIPopupMenuButton.icon(
                    onSelect: (menu) {
                      if (menu == 'Print Purchase Order') {
                        PrintUtil.generateAndPrintOpenPO(po);
                      }
                      if (menu == 'Cancel Purchase Order') {
                        context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.cancelPurchaseOrder(po.id!));
                        // .update(
                        //       StockOrderUpdate.CANCEL,
                        //       id: po.id!,
                        //       purchaseOrder: po,
                        //     );
                      }
                      if (menu == 'Delete Purchase Order') {
                        // context.read<PurchaseOrderBloc>().delete(po.id!);
                        context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.deletePurchaseOrder(po.id!));
                      }
                    },
                    icon: Assets.icons.more.setSize(20),
                    menu: [
                      if (po.status == StockOrderStatus.FOR_RECEIVING || po.status == StockOrderStatus.COMPLETED)
                        'Print Purchase Order',
                      if (po.status == StockOrderStatus.NEW || po.status == StockOrderStatus.FOR_RECEIVING) ...[
                        'Cancel Purchase Order',
                        'Delete Purchase Order',
                      ],
                    ],
                    menuAsString: (menu) => menu,
                  ),
                if (state.maybeMap(cancelling: (_) => true, deleting: (_) => true, orElse: () => false)) ...[
                  const UIHorizontalSpace(12),
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                  ),
                ],
              ],
            ),
            if (po.status == StockOrderStatus.NEW || po.status == StockOrderStatus.FOR_RECEIVING) ...[
              UIText.heading5(po.status == StockOrderStatus.NEW ? 'Step 2 of 4 - Editing' : 'Step 3 of 4 - Receiving'),
              const UIVerticalSpace(12),
              if (po.status == StockOrderStatus.NEW) const PurchaseOrderStepper(currentStep: 1),
              if (po.status == StockOrderStatus.FOR_RECEIVING) const PurchaseOrderStepper(currentStep: 2)
            ] else
              const Expanded(
                child: SingleChildScrollView(
                  child: PurchaseOrderDetails(),
                ),
              ),
          ],
        ),
        loadFailed: (message) => FailureView(message),
        orElse: () => const SizedBox(),
      ),
      // {
      //   if (state is PurchaseOrderByIdError) {
      //     return Text(state.message);
      //   }
      //   if (state is PurchaseOrderByIdLoading) {
      //     return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
      //   }
      //   return Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       PageHeader(
      //         title: _title,
      //         titleTrailings: [
      //           Padding(
      //             padding: const EdgeInsets.only(top: 1),
      //             child: Chip(
      //               label: Text(
      //                 _purchaseOrder.status!.label,
      //                 style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(_purchaseOrder.status!)),
      //               ),
      //               backgroundColor: StatusMapper.color(_purchaseOrder.status!),
      //               padding: const EdgeInsets.symmetric(horizontal: 8),
      //               visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10),
      //                 side: const BorderSide(color: UIColors.transparent),
      //               ),
      //             ),
      //           ),
      //           const UIHorizontalSpace(12),
      //           if (_purchaseOrder.status == StockOrderStatus.NEW ||
      //               _purchaseOrder.status == StockOrderStatus.FOR_RECEIVING ||
      //               _purchaseOrder.status == StockOrderStatus.COMPLETED)
      //             UIPopupMenuButton.icon(
      //               onSelect: (menu) {
      //                 if (menu == 'Print Purchase Order') {
      //                   PrintUtil.generateAndPrintOpenPO(_purchaseOrder);
      //                 }
      //                 if (menu == 'Cancel Purchase Order') {
      //                   context.read<PurchaseOrderRemoteCubit>().update(
      //                         StockOrderUpdate.CANCEL,
      //                         id: _purchaseOrder.id!,
      //                         purchaseOrder: _purchaseOrder,
      //                       );
      //                 }
      //                 if (menu == 'Delete Purchase Order') {
      //                   context.read<PurchaseOrderRemoteCubit>().delete(_purchaseOrder.id!);
      //                 }
      //               },
      //               icon: Assets.icons.more.setSize(20),
      //               menu: [
      //                 if (_purchaseOrder.status == StockOrderStatus.FOR_RECEIVING ||
      //                     _purchaseOrder.status == StockOrderStatus.COMPLETED)
      //                   'Print Purchase Order',
      //                 if (_purchaseOrder.status == StockOrderStatus.NEW ||
      //                     _purchaseOrder.status == StockOrderStatus.FOR_RECEIVING) ...[
      //                   'Cancel Purchase Order',
      //                   'Delete Purchase Order',
      //                 ],
      //               ],
      //               menuAsString: (menu) => menu,
      //             ),
      //           if (state is PurchaseOrderCancelLoading || state is PurchaseOrderDeleteLoading) ...[
      //             const UIHorizontalSpace(12),
      //             const SizedBox(
      //               width: 20,
      //               height: 20,
      //               child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
      //             ),
      //           ],
      //         ],
      //       ),
      //       if (_purchaseOrder.status == StockOrderStatus.NEW ||
      //           _purchaseOrder.status == StockOrderStatus.FOR_RECEIVING) ...[
      //         UIText.heading5(
      //             _purchaseOrder.status == StockOrderStatus.NEW ? 'Step 2 of 4 - Editing' : 'Step 3 of 4 - Receiving'),
      //         const UIVerticalSpace(12),
      //         if (_purchaseOrder.status == StockOrderStatus.NEW) const PurchaseOrderStepper(currentStep: 1),
      //         if (_purchaseOrder.status == StockOrderStatus.FOR_RECEIVING) const PurchaseOrderStepper(currentStep: 2)
      //       ] else
      //         const Expanded(
      //           child: SingleChildScrollView(
      //             child: PurchaseOrderDetails(),
      //           ),
      //         ),
      //     ],
      //   );
      // },
    );
  }

  String _title(StockOrderStatus status) {
    switch (status) {
      case StockOrderStatus.NEW:
        return 'Edit Purchase Order';
      case StockOrderStatus.FOR_RECEIVING:
        return 'Receive Purchase Order';
      case StockOrderStatus.COMPLETED || StockOrderStatus.CANCELLED:
        return 'Purchase Order';
      default:
        return Strings.empty;
    }
  }

  void _onSuccess(PurchaseOrder purchaseOrder) {
    context.read<PurchaseOrderFormCubit>().loadPurchaseOrder(purchaseOrder);
    SnackbarUtil.success(context, 'Purchase Order updated successfully.');
  }

  void _onDeleted() {
    context.goNamed('purchaseOrderList');
    SnackbarUtil.success(context, 'Purchase Order deleted successfully.');
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
