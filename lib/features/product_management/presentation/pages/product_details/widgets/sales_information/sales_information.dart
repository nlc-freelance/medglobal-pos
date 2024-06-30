import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

import 'pricing_and_stocks.dart';
import 'variations/variant_form.dart';

class SalesInformation extends StatefulWidget {
  const SalesInformation({super.key});

  @override
  State<SalesInformation> createState() => _SalesInformationState();
}

class _SalesInformationState extends State<SalesInformation> {
  bool isVariantFormVisible = false;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageSectionTitle('Sales Information'),
          if (isVariantFormVisible)
            VariantForm(onDisableVariations: () => setState(() => isVariantFormVisible = false))
          else ...[
            UIButton.secondary(
              'Add Variant',
              iconBuilder: (_) => Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter),
              onClick: () => setState(() => isVariantFormVisible = true),
            ),
            const UIVerticalSpace(40.0),
            PageSectionTitle.subsection('Pricing and Stocks'),
            const PricingAndStocks(),
          ],
        ],
      );
}
