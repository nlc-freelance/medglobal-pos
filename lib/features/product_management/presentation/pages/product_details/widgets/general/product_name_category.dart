import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductNameCategory extends StatelessWidget {
  const ProductNameCategory({super.key, this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => GetIt.I<ProductFormCubit>(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: UITextField.topLabel(
                label: 'Name',
                hint: 'Enter product name',
                onChanged: (value) => context.read<ProductFormCubit>().setName(value),
                showRequired: true,
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
        ),
      );
}
