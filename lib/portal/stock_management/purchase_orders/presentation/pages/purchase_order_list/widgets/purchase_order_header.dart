import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderHeader extends StatelessWidget {
  const PurchaseOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PageHeader(
      title: 'Purchase Orders',
      subtitle: 'View all purchase order operations to keep track of all items added to your inventory.',
      actions: [
        UIButton.filled(
          'New Purchase Order',
          icon: Assets.icons.add.setSize(12.0),
          onClick: () => context.goNamed('purchaseOrderCreate'),
          // onClick: () => context.goNamed('purchaseOrderCreate'),
        ),
      ],
    );
  }
}
