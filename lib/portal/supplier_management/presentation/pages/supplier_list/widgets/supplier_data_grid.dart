import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplierDataGrid extends StatefulWidget {
  const SupplierDataGrid(this.suppliers, {super.key});

  final List<Supplier> suppliers;

  @override
  State<SupplierDataGrid> createState() => _SupplierDataGridState();
}

class _SupplierDataGridState extends State<SupplierDataGrid> {
  late DataGridController _dataGridController;
  late SupplierDataSource _supplierDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _supplierDataSource = SupplierDataSource(widget.suppliers);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UIStyleContainer.topBorder,
      child: ClipRect(
        clipper: HorizontalBorderClipper(),
        child: SfDataGridTheme(
          data: DataGridUtil.rowNavigationStyle,
          child: SfDataGrid(
            source: _supplierDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.SUPPLIERS),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            footerHeight: 100,
            footer: _supplierDataSource.rows.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Assets.icons.cube.svg(),
                        const UIVerticalSpace(12),
                        UIText.labelMedium('No data available'),
                      ],
                    ),
                  )
                : null,
            onCellTap: (details) {
              final id = _supplierDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
              SupplierDetailsDialog(widget.suppliers.firstWhere((supplier) => supplier.id == id)).showSidePeek(context);
            },
          ),
        ),
      ),
    );
  }
}

class SupplierDataSource extends DataGridSource {
  SupplierDataSource(List<Supplier> suppliers) {
    _suppliers = suppliers;
    buildDataGridRows();
  }

  List<Supplier> _suppliers = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _suppliers.map((supplier) => supplier.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: UIText.bodyRegular(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
