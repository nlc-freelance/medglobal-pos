import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/branch_inventory/branch_inventory_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchInventory extends StatelessWidget {
  const BranchInventory({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          PageSectionTitle.subsection('Branch Inventory'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SearchDropdown<Branch>.multi(
                  hint: 'Select branch',
                  label: 'Branches',
                  isRequired: true,
                  showSelectedItems: false,
                  itemAsString: (branch) => branch.name,
                  asyncItemsCallback: GetIt.I<BranchRepository>().getAllBranches(),
                  onSelectItems: (branches) => {},
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
          // if (branches.isNotEmpty)
          const BranchInventoryDataGrid(branches: []),
          const UIVerticalSpace(40),
        ],
      );
}
