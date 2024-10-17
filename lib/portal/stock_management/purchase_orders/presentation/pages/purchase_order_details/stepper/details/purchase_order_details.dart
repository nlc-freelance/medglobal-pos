import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_items_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_items_received_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/purchase_items_to_receive_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PurchaseOrderDetails extends StatefulWidget {
  const PurchaseOrderDetails({super.key});

  @override
  State<PurchaseOrderDetails> createState() => _PurchaseOrderDetailsState();
}

class _PurchaseOrderDetailsState extends State<PurchaseOrderDetails> {
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final purchaseOrder = context.read<PurchaseOrderCubit>().state.purchaseOrder;

    _notesController = TextEditingController(text: purchaseOrder.notes)
      ..addListener(() => context.read<PurchaseOrderCubit>().setNotes(_notesController.text));
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PurchaseOrderCubit, PurchaseOrderState, PurchaseOrder>(
      selector: (state) => state.purchaseOrder,
      builder: (context, purchaseOrder) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      : Strings.noValue,
                ),
                if (purchaseOrder.status == StockOrderStatus.FOR_RECEIVING)
                  LabelValue.text(
                    label: 'Estimated Date of Arrival',
                    value: purchaseOrder.estimatedDateOfArrival != null
                        ? DateFormat.yMd().format(purchaseOrder.estimatedDateOfArrival!)
                        : Strings.noValue,
                  ),
                if (purchaseOrder.status == StockOrderStatus.COMPLETED)
                  LabelValue.text(
                    label: 'Received Date',
                    value: purchaseOrder.updatedAt != null
                        ? DateFormat.yMd().format(purchaseOrder.updatedAt!)
                        : Strings.noValue,
                  ),
                LabelValue.text(
                  label: 'Supplier',
                  value: purchaseOrder.supplier?.name,
                ),
                LabelValue.text(
                  label: 'Target Branch',
                  value: purchaseOrder.branch?.name,
                ),
                if (purchaseOrder.status == StockOrderStatus.NEW)
                  LabelValue.button(
                    label: 'Estimated Date of Arrival',
                    button: DatePickerPopup(
                      isInput: true,
                      selectionMode: DateRangePickerSelectionMode.single,
                      selectedDate: purchaseOrder.estimatedDateOfArrival,
                      onSelect: (date) => context.read<PurchaseOrderCubit>().setEstimatedDateOfArrival(date),
                    ),
                  )
              ],
            ),
            const UIVerticalSpace(40),
            if (purchaseOrder.status == StockOrderStatus.NEW) const PurchaseItemsDataGrid(),
            if (purchaseOrder.status == StockOrderStatus.FOR_RECEIVING) const PurchaseItemsToReceiveDataGrid(),
            if (purchaseOrder.status == StockOrderStatus.COMPLETED ||
                purchaseOrder.status == StockOrderStatus.CANCELLED)
              const PurchaseItemsReceivedDataGrid(),
            const UIVerticalSpace(60),
            const PageSectionTitle(title: 'Notes'),
            purchaseOrder.status == StockOrderStatus.COMPLETED || purchaseOrder.status == StockOrderStatus.CANCELLED
                ? UIText.bodyRegular(purchaseOrder.notes ?? Strings.empty)
                : UITextField.noLabel(
                    controller: _notesController,
                    hint: 'Enter notes here',
                  ),
            const UIVerticalSpace(60),
          ],
        );
      },
    );
  }
}
