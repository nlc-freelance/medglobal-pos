import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general/product_image.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general/product_name_category.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key, required this.productNameController});

  final TextEditingController productNameController;

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  late ProductFormCubit _productFormCubit;

  @override
  void initState() {
    super.initState();
    _productFormCubit = BlocProvider.of<ProductFormCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductFormCubit, ProductFormState, Product?>(
        selector: (state) => state.product,
        builder: (context, product) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageSectionTitle('General Information'),
              ProductNameCategory(controller: widget.productNameController),
              const UIVerticalSpace(24),
              const ProductImage(),
              const UIVerticalSpace(40),
            ],
          );
        });
  }
}
