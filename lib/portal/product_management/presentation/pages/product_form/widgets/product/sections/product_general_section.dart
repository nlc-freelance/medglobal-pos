import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_form_cubit/product_form_cubit.dart';
// import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/general/product_image.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductGeneralSection extends StatefulWidget {
  const ProductGeneralSection({super.key});

  @override
  State<ProductGeneralSection> createState() => _ProductGeneralSectionState();
}

class _ProductGeneralSectionState extends State<ProductGeneralSection> {
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
                  child: CategoryDropdown(
                    selectedItem: state.category,
                    onChanged: (category) => context.read<ProductFormCubit>().setCategory(category),
                  ),
                ),
              ],
            );
          },
        ),
        const UIVerticalSpace(24),
        // const ProductImage(),
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
