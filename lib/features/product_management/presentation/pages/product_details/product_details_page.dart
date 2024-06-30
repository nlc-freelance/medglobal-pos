import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general_information/general_information.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/sales_information/sales_information.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Add Product',
          subtitle: Strings.subtitlePlaceholder,
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GeneralInformation(),
                SalesInformation(),
              ],
            ),
          ),
        ),
        CancelActionButton(
          onCancel: () => AppRouter.router.pushReplacementNamed(SideMenuTreeItem.manageProducts.name),
          onAction: () {
            // TODO: Add Product
          },
        ),
      ],
    );
  }
}
