import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/widgets/bulk_delete.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/widgets/bulk_edit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SelectedProductsToolbar extends StatelessWidget {
  const SelectedProductsToolbar(this.controller, {super.key});

  final DataGridController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          UIText.labelMedium('${controller.selectedRows.length} item(s) selected', color: UIColors.textLight),
          const UIHorizontalSpace(16.0),
          const BulkEdit(),
          const UIHorizontalSpace(16.0),
          const BulkDelete(),
        ],
      ),
    );
  }
}
