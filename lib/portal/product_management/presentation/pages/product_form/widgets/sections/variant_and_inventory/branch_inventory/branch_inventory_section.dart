import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/variant_and_inventory/branch_inventory/branch_inventory_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchInventorySection extends StatelessWidget {
  const BranchInventorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final variantFormCubit = context.read<VariantFormCubit>();

    return BlocBuilder<VariantFormCubit, VariantFormState>(
      builder: (context, state) {
        return Column(
          children: [
            PageSectionTitle.subsection(
              title: 'Inventory per Branch',
              subtitle: 'Enter price and quantity on hand (QOH) per branch',
            ),
            Row(
              children: [
                Expanded(
                  child: AppDropdownFormField<Branch>.lazy(
                    label: 'Branches',
                    hint: state.branches.isEmpty ? 'Select branch' : '${state.branches.length} branch(es) selected',
                    showSelectedItem: false,
                    isRequired: true,
                    getName: (branch) => branch.name,
                    onChanged: (branch) => variantFormCubit.addBranchInventory(branch),
                  ),
                ),
                const Spacer(flex: 2),
                const UIHorizontalSpace(32),
              ],
            ),
            if (state.variant.branchInventories?.isNotEmpty ?? false) ...[
              const UIVerticalSpace(24),
              const BranchInventoryDataGrid(),
            ],
          ],
        );
      },
    );
  }
}
