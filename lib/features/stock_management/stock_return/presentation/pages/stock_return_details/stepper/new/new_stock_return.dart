import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockReturn extends StatelessWidget {
  const NewStockReturn({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchDropdown<Supplier>.single(
            hint: 'Select supplier',
            label: 'Supplier',
            isLeftLabel: true,
            isRequired: true,
            itemAsString: (supplier) => supplier.name,
            asyncItemsCallback: (_) => GetIt.I<SupplierRepository>().getAllSuppliers(),
            onSelectItem: (Supplier value) {},
          ),
          const UIVerticalSpace(16),
          SearchDropdown<Branch>.single(
            hint: 'Select branch',
            label: 'Return from Branch',
            isLeftLabel: true,
            isRequired: true,
            itemAsString: (branch) => branch.name,
            asyncItemsCallback: (_) => GetIt.I<BranchRepository>().getAllBranches(),
            onSelectItem: (Branch value) {},
          ),
          const UIVerticalSpace(40),
          const Divider(color: UIColors.borderMuted, thickness: 0.8),
          const UIVerticalSpace(30),
        ],
      ),
    );
  }
}
