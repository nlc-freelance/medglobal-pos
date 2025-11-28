import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeader(
      title: 'Manage Products',
      subtitle: 'View and manage products to keep track your inventory items.',
      actions: [
        UIButton.filled(
          'New Product',
          icon: Assets.icons.add.setSize(12.0),
          onClick: () => AppRouter.router.goNamed('productCreate'),
        ),
      ],
    );
  }
}
