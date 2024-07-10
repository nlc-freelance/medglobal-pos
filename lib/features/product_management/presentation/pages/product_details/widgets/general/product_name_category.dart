import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductNameCategory extends StatefulWidget {
  const ProductNameCategory({super.key, this.product, required this.controller});

  final Product? product;
  final TextEditingController controller;

  @override
  State<ProductNameCategory> createState() => _ProductNameCategoryState();
}

class _ProductNameCategoryState extends State<ProductNameCategory> {
  late ProductFormCubit _productFormCubit;

  // late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _productFormCubit = BlocProvider.of<ProductFormCubit>(context);

    // final currentProduct = _productFormCubit.state.product;

    // _nameController = TextEditingController(text: widget.product?.name);
    // ..addListener(() => _productFormCubit.setName(_nameController.text));
  }

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: UITextFormField.topLabel(
              label: 'Name',
              hint: 'Enter product name',
              controller: widget.controller,
              showRequired: true,
              validator: (value) {
                if (value?.isEmpty == true) return 'Please enter a product name.';
                return null;
              },
            ),
          ),
          const UIHorizontalSpace(16),
          Expanded(
            child: CategoryDropdown(
              selectedItem: widget.product?.category,
              onChanged: (category) => _productFormCubit.setCategory(category),
            ),
          ),
        ],
      );
}
