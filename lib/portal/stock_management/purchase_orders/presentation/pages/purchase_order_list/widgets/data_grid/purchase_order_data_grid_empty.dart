import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';

class PurchaseOrderDataGridEmpty extends StatelessWidget {
  const PurchaseOrderDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataGridEmpty(
      title: Strings.productEmptyTitle,
      subtitle: Strings.productEmptySubtitle,
    );
  }
}
