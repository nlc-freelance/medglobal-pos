import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class UndeliveredItemsDialog extends StatefulWidget {
  const UndeliveredItemsDialog({super.key});

  @override
  State<UndeliveredItemsDialog> createState() => _UndeliveredItemsDialogState();
}

class _UndeliveredItemsDialogState extends State<UndeliveredItemsDialog> {
  @override
  Widget build(BuildContext context) => BlocBuilder<PurchaseOrderCubit, PurchaseOrderState>(
        builder: (_, state) {
          final undeliveredItems = (state.purchaseOrder.items ?? []).where((item) => item.qtyReceived == null).toList();
          return Dialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            backgroundColor: UIColors.background,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.35,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('Undelivered Items (${undeliveredItems.length})'),
                  const Divider(color: UIColors.borderMuted),
                  const UIVerticalSpace(8),
                  UIText.bodyRegular(
                    'The following items have not been assigned a received quantity. If you continue on marking this Purchase Order as received, it will automatically set the received quantity of these items to zero (0), indicating that they were not delivered with this order.',
                    align: TextAlign.justify,
                  ),
                  const UIVerticalSpace(16),
                  Row(
                    children: [
                      Expanded(child: UIText.dataGridHeader('Variant Name')),
                      Expanded(child: UIText.dataGridHeader('SKU')),
                    ],
                  ),
                  const UIHorizontalSpace(12),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 120),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: undeliveredItems.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Expanded(child: UIText.dataGridText('${undeliveredItems[index].name}')),
                            Expanded(child: UIText.dataGridText('${undeliveredItems[index].sku}')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const UIVerticalSpace(16),
                  UIText.labelSemiBold('Would you like to continue?'),
                  CancelActionButton(
                    actionLabel: 'Continue',
                    isLoading: state is StockTakeMarkAsCompletedLoading,
                    onCancel: () => Navigator.pop(context),
                    onAction: () {
                      Navigator.pop(context);
                      context.read<PurchaseOrderRemoteCubit>().update(
                            StockOrderUpdate.SAVE_AND_RECEIVED,
                            id: state.purchaseOrder.id!,
                            purchaseOrder: state.purchaseOrder.copyWith(
                              items: state.purchaseOrder.items
                                  ?.map((item) => item.qtyReceived == null ? item.copyWith(qtyReceived: 0) : item)
                                  .toList(),
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
}
