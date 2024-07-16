import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_list/widgets/bulk_action_popup_menu.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SelectedProductsToolbar extends StatelessWidget with DialogMixin {
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
          const BulkActionPopupMenu(),
        ],
      ),
    );
  }
}
