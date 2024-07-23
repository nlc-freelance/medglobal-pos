import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/general/product_image.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/general/product_name_category.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({super.key, required this.productNameController});

  final TextEditingController productNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'General Information'),
        ProductNameCategory(controller: productNameController),
        const UIVerticalSpace(24),
        const ProductImage(),
        const UIVerticalSpace(40),
      ],
    );
  }
}
