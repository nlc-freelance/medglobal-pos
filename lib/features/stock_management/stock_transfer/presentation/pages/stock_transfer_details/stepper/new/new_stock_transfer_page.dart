import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/stock_transfer_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockTransferPage extends StatelessWidget {
  const NewStockTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'New Stock Transfer',
          subtitle: Strings.subtitlePlaceholder,
        ),
        UIText.heading5('Step 1 of 4 - Creation'),
        const UIVerticalSpace(12),
        const StockTransferStepper(),
      ],
    );
  }
}
