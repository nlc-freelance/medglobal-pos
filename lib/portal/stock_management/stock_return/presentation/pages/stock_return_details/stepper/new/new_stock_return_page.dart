import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/stock_return_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockReturnPage extends StatelessWidget {
  const NewStockReturnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'New Stock Return',
          subtitle: Strings.subtitlePlaceholder,
        ),
        UIText.heading5('Step 1 of 3 - Creation'),
        const UIVerticalSpace(12),
        const StockReturnStepper(),
      ],
    );
  }
}
