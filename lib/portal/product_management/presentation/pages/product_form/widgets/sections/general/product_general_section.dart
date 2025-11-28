import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/sections/general/product_image.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/category_form/category_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductGeneralSection extends StatefulWidget {
  const ProductGeneralSection({super.key});

  @override
  State<ProductGeneralSection> createState() => _ProductGeneralSectionState();
}

class _ProductGeneralSectionState extends State<ProductGeneralSection> with DialogMixin {
  late ProductFormCubit _productFormCubit;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _productFormCubit = context.read<ProductFormCubit>();
    _nameController = TextEditingController(text: _productFormCubit.state.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'General Information'),
        BlocBuilder<ProductFormCubit, ProductFormState>(
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AppTextFormField.top(
                    label: 'Name',
                    hint: 'Enter product name',
                    controller: _nameController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a product name.'),
                    onChanged: (value) => _productFormCubit.setName(value),
                  ),
                ),
                const UIHorizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppDropdownFormField<Category>.lazy(
                        label: 'Category',
                        hint: 'Select category',
                        getName: (category) => category.name,
                        value: state.category,
                        onChanged: (category) => _productFormCubit.setCategory(category),
                      ),
                      const UIVerticalSpace(8),
                      InkWell(
                        onTap: () => showCustomDialog(context,
                            dialog: BlocProvider(
                              create: (context) => GetIt.I<CategoryBloc>(),
                              child: const CategoryFormDialog(),
                            )),
                        hoverColor: UIColors.transparent,
                        highlightColor: UIColors.transparent,
                        child: Row(
                          children: [
                            Assets.icons.add.svg(colorFilter: UIColors.primary.toColorFilter, width: 12),
                            const UIHorizontalSpace(6),
                            UIText.labelMedium('New category', color: UIColors.primary),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const UIVerticalSpace(10),
        const ProductImage(),
        const UIVerticalSpace(40),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
