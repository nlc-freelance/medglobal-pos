import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/widgets/add_category_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

// TODO: When user opens the dropdown, onchanged is triggered and null is passed as the value of category

class CategoryDropdown extends StatefulWidget {
  const CategoryDropdown({
    super.key,
    this.selectedItem,
    required this.onChanged,
  });

  final Function(Category value) onChanged;
  final Category? selectedItem;

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  Category? _addedCategoryAsSelectedItem;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            right: 0,
            top: 20,
            child: Material(
              color: UIColors.background,
              child: UIOutlinedIconButton(
                icon: Assets.icons.add.svg(colorFilter: UIColors.textRegular.toColorFilter, width: 12),
                // icon: const Icon(Icons.add, size: 14),
                border: const Border(
                  top: BorderSide(color: UIColors.borderRegular),
                  bottom: BorderSide(color: UIColors.borderRegular),
                  right: BorderSide(color: UIColors.borderRegular),
                ),
                radius: const BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                onTap: () => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const AddCategoryDialog(),
                ),
              ),
            ),
          ),
          BlocListener<CategoryCubit, CategoryState>(
            listener: (context, state) {
              if (state is CategorySuccess) {
                setState(() => _addedCategoryAsSelectedItem = state.category);
                widget.onChanged(state.category);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 31.0),
              child: SearchDropdown<Category>.single(
                label: 'Category',
                hint: 'Select category',
                selectedItem: widget.selectedItem ?? _addedCategoryAsSelectedItem,
                onSelectItem: (value) => widget.onChanged(value),
                itemAsString: (item) => item.name!,
                asyncItemsCallback: GetIt.I<CategoryRepository>().getAllCategories(),
              ),
            ),
          ),
        ],
      );
}
