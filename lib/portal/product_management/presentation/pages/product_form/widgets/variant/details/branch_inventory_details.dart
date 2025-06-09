import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_lite_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/details/branch_inventory_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchInventoryDetails extends StatelessWidget {
  const BranchInventoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VariantFormCubit, VariantFormState>(
      builder: (context, state) {
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
                  child: BranchLiteDropdown.input_top(
                    label: 'Branches',
                    hint: 'Select branch',
                    required: true,
                    isMultiSelect: true,
                    selectedItems: state.branches,
                    onSelectItem: (branch) => context.read<VariantFormCubit>().addBranchInventory(branch),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
            if (state.branchInventories.isNotEmpty == true) ...[
              const UIVerticalSpace(16),
              const BranchInventoryDataGrid(),
            ],
          ],
        );
      },
    );
  }
}
