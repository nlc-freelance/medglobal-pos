import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/sales_information/variations/variant_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

import '../pricing_and_stocks.dart';

class VariantForm extends StatelessWidget {
  const VariantForm({super.key, required this.onDisableVariations});

  final VoidCallback onDisableVariations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageSectionTitle.subsectionWithSubtitleAndAction(
          title: 'Variations',
          subtitle: Strings.subtitlePlaceholder,
          action: UIButton.text(
            'Disable variations',
            iconBuilder: (isHover) => Assets.icons.minusSquare.setColorOnHover(isHover),
            onClick: onDisableVariations,
            // onClick: () => context.read<ProductCubit>().showHideVariantForm(false),
          ),
        ),
        DottedBorder(
          color: UIColors.borderRegular,
          radius: const Radius.circular(8.0),
          strokeWidth: 2,
          dashPattern: const [8],
          borderType: BorderType.RRect,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.labelMedium('Variant Details'),
                const UIVerticalSpace(24.0),
                UITextField.topLabel(label: 'Variant Name', controller: TextEditingController()),
                const UIVerticalSpace(30.0),
                const PricingAndStocks(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: UIButton.secondary(
                    'Add Variant',
                    onClick: () {
                      // TODO: Add Variant to variant list summary
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // Display if a variant is added, else hide
        const VariantDataGrid(),
      ],
    );
  }
}
