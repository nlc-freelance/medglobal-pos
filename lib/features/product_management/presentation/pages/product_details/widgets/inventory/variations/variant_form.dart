import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/suppliers_stock_details/suppliers_stock_details.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/variations/variant_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

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
          ),
        ),
        DottedBorder(
          color: UIColors.borderRegular,
          radius: const Radius.circular(12),
          dashPattern: const [10],
          borderType: BorderType.RRect,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UITextField.leftLabel(
                      width: 500,
                      label: 'Variant Name',
                      hint: 'Enter variant name',
                      controller: TextEditingController(),
                      showRequired: true,
                    ),
                  ],
                ),
                const UIVerticalSpace(40),
                const SuppliersStockDetails(),
                const BranchInventory(),
                const UIVerticalSpace(30.0),
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
        const UIVerticalSpace(40.0),
      ],
    );
  }
}
