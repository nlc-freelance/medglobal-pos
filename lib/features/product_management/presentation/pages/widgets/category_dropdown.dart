import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/category/get_all_categories.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/widgets/add_category_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
            right: 0,
            top: 20,
            child: UIOutlinedIconButton(
              icon: const Icon(Icons.add, size: 12),
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
          // Text(_categories.toString()),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SearchDropdown<Category>.single(
              label: 'Category',
              hint: 'Select category',
              itemAsString: (item) => item.name,
              asyncItemsCallback: GetIt.I<GetAllCategoriesUseCase>().call(),
            ),
          ),
        ],
      );
}
