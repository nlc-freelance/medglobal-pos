import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch_repository.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({
    super.key,
    required this.onSelect,
  });

  final void Function(DateTime value) onSelect;

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      tooltip: Strings.empty,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          enabled: false,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 500,
            // height: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.labelSemiBold('Add filter'),
                const UIVerticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIText.labelRegular('Branch'),
                    UIButton.text('Clear', onClick: () {}),
                  ],
                ),
                SearchDropdown<Branch>.single(
                  hint: 'All branches',
                  label: '',
                  itemAsString: (branch) => branch.name,
                  asyncItemsCallback: GetIt.I<BranchRepository>().getAllBranches(),
                  onSelectItem: (Branch value) => {},
                ),
                const UIVerticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIText.labelRegular('Supplier'),
                    UIButton.text('Clear', onClick: () {}),
                  ],
                ),
                SearchDropdown<Supplier>.single(
                  hint: 'All suppliers',
                  label: '',
                  itemAsString: (branch) => branch.name,
                  asyncItemsCallback: GetIt.I<SupplierRepository>().getAllSuppliers(),
                  onSelectItem: (Supplier value) => {},
                ),
                const UIVerticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIButton.text('Reset', onClick: () {}),
                    UIButton.text('Apply', onClick: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      child: HoverBuilder(
        builder: (isHover) => Container(
          padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: UIColors.background,
            border: Border.all(color: isHover ? UIColors.buttonPrimaryHover : UIColors.borderRegular),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.filter1.setColorOnHover(isHover),
              const UIHorizontalSpace(10),
              UIText.labelMedium(
                'Filter',
                color: isHover ? UIColors.primary : UIColors.textRegular,
              ),
              const Spacer(),
              Assets.icons.arrowDown.setColorOnHover(isHover)
            ],
          ),
        ),
      ),
    );
  }
}
