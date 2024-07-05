import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general/product_image.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general/product_name_category.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageSectionTitle('General Information'),
        ProductNameCategory(),
        UIVerticalSpace(24),
        ProductImage(),
        UIVerticalSpace(40),
      ],
    );
  }
}
