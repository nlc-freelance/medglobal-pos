import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderDataGridEmpty extends StatelessWidget {
  const PurchaseOrderDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return DataGridEmpty(
      title: Strings.productEmptyTitle,
      subtitle: Strings.productEmptySubtitle,
      action: UIButton.filled(
        Strings.newProduct,
        icon: Assets.icons.add.setSize(12.0),
        onClick: () {},
      ),
    );
  }
}
