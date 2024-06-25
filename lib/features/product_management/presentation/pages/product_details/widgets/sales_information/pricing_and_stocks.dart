import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PricingAndStocks extends StatelessWidget {
  const PricingAndStocks({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
        mainAxisExtent: 60,
      ),
      shrinkWrap: true,
      children: [
        UITextField.topLabel(
          label: 'SKU',
          hint: 'Enter SKU',
          controller: TextEditingController(),
          showRequired: true,
        ),
        UITextField.topLabel(
          label: 'Price (PHP)',
          hint: 'Enter price',
          controller: TextEditingController(),
          showRequired: true,
        ),
        UITextField.topLabel(
          label: 'Cost (PHP)',
          hint: 'Enter cost',
          controller: TextEditingController(),
        ),
        UITextField.topLabel(
          label: 'Qty on Hand',
          hint: 'Enter stock',
          controller: TextEditingController(),
          showRequired: true,
        ),
        UITextField.topLabel(
          label: 'Warning Stock Level',
          hint: 'Enter warning stock',
          controller: TextEditingController(),
        ),
        UITextField.topLabel(
          label: 'Ideal Stock level',
          hint: 'Enter ideal stock level',
          controller: TextEditingController(),
        ),
        UITextField.topLabel(
          label: 'Suppliers',
          hint: 'Select supplier',
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
