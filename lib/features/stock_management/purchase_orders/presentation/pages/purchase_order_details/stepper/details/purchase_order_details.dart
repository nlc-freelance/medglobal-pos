import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/items_received_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/details/items_to_order_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PurchaseOrderDetails extends StatelessWidget {
  const PurchaseOrderDetails(this.status, {super.key});

  final StockActionStatus status;

  @override
  Widget build(BuildContext context) {
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
              value: '1',
            ),
            LabelValue.text(
              label: 'Created Date',
              value: DateFormat.yMd().format(DateTime.now()),
            ),

            /// If status is For Receiving / Completed / Cancelled
            if (status != StockActionStatus.NEW)
              LabelValue.text(
                label: 'Received Date',
                value: DateFormat.yMd().format(DateTime.now()),
              ),
            LabelValue.text(
              label: 'Supplier',
              value: 'MAX GLOW',
            ),
            LabelValue.text(
              label: 'Target Branch',
              value: 'Manila Branch',
            ),

            /// If status is 'New'
            if (status == StockActionStatus.NEW)
              LabelValue.button(
                label: 'Estimated Date of Arrival',
                button: DatePickerPopup(onSelect: (date) => print(date)),
              )
          ],
        ),
        const UIVerticalSpace(40),
        status == StockActionStatus.NEW
            ? const ItemsToOrderDataGrid()
            : ItemsReceivedDataGrid(isReceiving: status == StockActionStatus.FOR_RECEIVING),
        const UIVerticalSpace(60),
        const PageSectionTitle(title: 'Notes'),
        UITextField.noLabel(hint: 'Enter notes here'),
        const UIVerticalSpace(60),
      ],
    );
  }
}
