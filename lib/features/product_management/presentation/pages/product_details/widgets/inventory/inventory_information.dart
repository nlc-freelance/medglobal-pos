import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/suppliers_stock_details/suppliers_stock_details.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'variations/variant_form.dart';

class InventoryInformation extends StatefulWidget {
  const InventoryInformation({super.key});

  @override
  State<InventoryInformation> createState() => _InventoryInformationState();
}

class _InventoryInformationState extends State<InventoryInformation> {
  bool isVariantFormVisible = false;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageSectionTitle('Inventory and Variants'),
          if (isVariantFormVisible)
            VariantForm(onDisableVariations: () => setState(() => isVariantFormVisible = false))
          else ...[
            UIButton.secondary(
              'Add Variant',
              iconBuilder: (_) => Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter),
              onClick: () => setState(() => isVariantFormVisible = true),
            ),
            const UIVerticalSpace(40),
            const SuppliersStockDetails(),
            const BranchInventory(),
            const UIVerticalSpace(60),
          ],
        ],
      );
}
