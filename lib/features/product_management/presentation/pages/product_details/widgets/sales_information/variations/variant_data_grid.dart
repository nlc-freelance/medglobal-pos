import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/variant.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VariantDataGrid extends StatelessWidget {
  const VariantDataGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: DataGrid<Variant>(
        columns: DataGridUtil.getGridColumns(DataGridColumn.variants),
        data: variantList,
        navigationMode: GridNavigationMode.row,
        style: StyleDataGrid.base,
      ),
    );
  }
}
