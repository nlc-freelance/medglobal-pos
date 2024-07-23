import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewPurchaseOrderPage extends StatelessWidget {
  const NewPurchaseOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'New Purchase Order',
          subtitle: Strings.subtitlePlaceholder,
        ),
        UIText.heading5('Step 1 of 4 - Creation'),
        const UIVerticalSpace(12),
        const PurchaseOrderStepper(),
      ],
    );
  }
}
