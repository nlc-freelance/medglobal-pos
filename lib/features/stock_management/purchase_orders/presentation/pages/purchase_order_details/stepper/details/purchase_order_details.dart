import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/items_received_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/items_to_order_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderDetails extends StatefulWidget {
  const PurchaseOrderDetails({super.key});

  @override
  State<PurchaseOrderDetails> createState() => _PurchaseOrderDetailsState();
}

class _PurchaseOrderDetailsState extends State<PurchaseOrderDetails> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tax = context.select((PurchaseOrderCubit cubit) => cubit.state.purchaseOrder.tax);
    final discount = context.select((PurchaseOrderCubit cubit) => cubit.state.purchaseOrder.tax);

    return BlocSelector<PurchaseOrderCubit, PurchaseOrderState, PurchaseOrder>(
      selector: (state) => state.purchaseOrder,
      builder: (context, purchaseOrder) {
        return Column(
          children: [
            const UIVerticalSpace(20),
            const PageSectionTitle(title: 'General Information'),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
                mainAxisExtent: 60,
              ),
              shrinkWrap: true,
              children: [
                LabelValue.text(
                  label: 'Purchase Order ID',
                  value: purchaseOrder.id.toString(),
                ),
                LabelValue.text(
                  label: 'Created Date',
                  value: purchaseOrder.createdAt != null
                      ? DateFormat.yMd().format(purchaseOrder.createdAt!)
                      : Strings.empty,
                ),

                /// If status is For Receiving / Completed / Cancelled
                if (purchaseOrder.status != StockActionStatus.NEW)
                  LabelValue.text(
                    label: 'Received Date',
                    value: purchaseOrder.estimatedDateOfArrival != null
                        ? DateFormat.yMd().format(purchaseOrder.estimatedDateOfArrival!)
                        : Strings.empty,
                  ),
                LabelValue.text(
                  label: 'Supplier',
                  value: purchaseOrder.supplier?.name,
                ),
                LabelValue.text(
                  label: 'Target Branch',
                  value: purchaseOrder.branch?.name,
                ),

                /// If status is 'New'
                if (purchaseOrder.status == StockActionStatus.NEW)
                  LabelValue.button(
                    label: 'Estimated Date of Arrival',
                    button: DatePickerPopup(
                      onSelect: (date) => context.read<PurchaseOrderCubit>().setEstimatedDateOfArrival(date),
                    ),
                  )
              ],
            ),
            const UIVerticalSpace(40),
            purchaseOrder.status == StockActionStatus.NEW
                ? const ItemsToOrderDataGrid()
                : ItemsReceivedDataGrid(
                    itemsReceived: purchaseOrder.items ?? [],
                    isReceiving: purchaseOrder.status == StockActionStatus.FOR_RECEIVING,
                    tax: tax ?? 0,
                    discount: discount ?? 0,
                  ),
            const UIVerticalSpace(60),
            const PageSectionTitle(title: 'Notes'),
            UITextField.noLabel(
              hint: 'Enter notes here',

              ///
            ),
            const UIVerticalSpace(60),
          ],
        );
      },
    );
  }
}
