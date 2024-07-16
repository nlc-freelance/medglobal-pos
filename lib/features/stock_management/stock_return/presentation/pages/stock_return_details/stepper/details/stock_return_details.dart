import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/pages/stock_return_details/stepper/details/stock_return_item_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockReturnDetails extends StatelessWidget {
  const StockReturnDetails(this.status, {super.key});

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
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 16,
            mainAxisExtent: 60,
          ),
          shrinkWrap: true,
          children: [
            LabelValue.text(
              label: 'Stock Return ID',
              value: '1',
            ),
            LabelValue.text(
              label: 'Created Date',
              value: DateFormat.yMd().format(DateTime.now()),
            ),
            LabelValue.text(
              label: 'Supplier',
              value: 'MAX GLOW',
            ),
            LabelValue.text(
              label: 'Return from',
              value: 'Manila Branch',
            ),
          ],
        ),
        const UIVerticalSpace(40),
        StockReturnItemDataGrid(isCompleted: status == StockActionStatus.COMPLETED),
        const UIVerticalSpace(60),
        const PageSectionTitle(title: 'Notes'),
        UITextField.noLabel(hint: 'Enter notes here'),
        const UIVerticalSpace(60),
      ],
    );
  }
}
