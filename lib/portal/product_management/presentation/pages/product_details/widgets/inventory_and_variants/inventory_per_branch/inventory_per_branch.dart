import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/inventory_and_variants/inventory_per_branch/inventory_per_branch_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class InventoryPerBranch extends StatelessWidget {
  const InventoryPerBranch({super.key});

  @override
  Widget build(BuildContext context) => BlocSelector<VariantFormCubit, VariantFormState, Variant?>(
        selector: (state) => state.variant,
        builder: (context, variant) {
          return Column(
            children: [
              PageSectionTitle.subsection(
                title: 'Inventory per Branch',
                subtitle: 'Enter price and quantity on hand (QOH) per selected branch',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BranchDropdown.input_top(
                      label: 'Branches',
                      hint: 'Select branch',
                      required: true,
                      isMultiSelect: true,
                      selectedItems: variant?.getAllBranches() ?? [],
                      onSelectItem: (branch) => context.read<VariantFormCubit>().addBranchInventory(branch),
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              if (variant?.branchInventories?.isNotEmpty == true) ...[
                const UIVerticalSpace(16),
                const BranchInventoryDataGrid(),
              ],
            ],
          );
        },
      );
}
