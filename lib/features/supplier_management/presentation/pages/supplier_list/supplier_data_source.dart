import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplierDataSource extends BaseDataSource {
  final List<Supplier> suppliers;

  SupplierDataSource({required this.suppliers});

  @override
  List<DataGridRow> get rows => dataGridRows;

  void _build() => dataGridRows = suppliers
      .map(
        (row) => DataGridRow(
          cells: [
            DataGridCell<int>(columnName: 'id', value: row.id),
            DataGridCell<String>(columnName: 'name', value: row.name),
            DataGridCell<String>(columnName: 'email', value: row.email),
            DataGridCell<String>(columnName: 'phone', value: row.phone),
          ],
        ),
      )
      .toList();

  @override
  List<DataGridRow> build() {
    _build();
    return dataGridRows;
  }

  @override
  void update() => notifyListeners();

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

  // @override
  // void _buildDataGridRow() => dataGridRows = suppliers
  //     .map((row) => DataGridRow(
  //         cells: DataGridColumn.suppliers
  //             .map((column) => DataGridCell<String>(
  //                   columnName: column.name,
  //                   value: row.get(column.name),
  //                 ))
  //             .toList()))
  //     .toList();
}
