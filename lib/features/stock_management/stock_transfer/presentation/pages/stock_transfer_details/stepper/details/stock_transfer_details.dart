import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/items_to_transfer_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/items_transferred_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTransferDetails extends StatelessWidget {
  const StockTransferDetails(this.status, {super.key});

  final StockOrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UIVerticalSpace(20),
        const PageSectionTitle(title: 'General Information'),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 16,
            mainAxisExtent: 60,
          ),
          shrinkWrap: true,
          children: [
            LabelValue.text(
              label: 'Stock Transfer ID',
              value: '1',
            ),
            LabelValue.text(
              label: 'Created Date',
              value: DateFormat.yMd().format(DateTime.now()),
            ),
            LabelValue.text(
              label: 'Source Branch',
              value: 'Manila Branch',
            ),
            LabelValue.text(
              label: 'Destination Branch',
              value: 'Pasig Branch',
            ),
          ],
        ),
        const UIVerticalSpace(40),
        if (status == StockOrderStatus.NEW || status == StockOrderStatus.SHIPPED)
          ItemsToTransferDataGrid(isShipped: status == StockOrderStatus.SHIPPED),
        const UIVerticalSpace(60),
        const PageSectionTitle(title: 'Notes'),
        UITextField.noLabel(hint: 'Enter notes here'),
        const UIVerticalSpace(60),
      ],
    );
  }
}
