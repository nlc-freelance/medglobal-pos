import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductNameCategory extends StatelessWidget {
  const ProductNameCategory({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) => BlocSelector<ProductFormCubit, ProductFormState, Product?>(
        selector: (state) => state.product,
        builder: (context, product) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: UITextFormField.vertical(
                  label: 'Name',
                  hint: 'Enter product name',
                  controller: controller,
                  isRequired: true,
                  validator: FormValidators.required('Please enter a product name.'),
                  // TODO: Refactor product form state management
                  onChanged: (_) {},
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                child: CategoryDropdown(
                  selectedItem: product?.category,
                  onChanged: (category) => context.read<ProductFormCubit>().setCategory(category),
                ),
              ),
            ],
          );
        },
      );
}
