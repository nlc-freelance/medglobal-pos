import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/data_grid/product_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductDataSource extends BaseDataSource {
  final List<ProductGrid> products;

  ProductDataSource({required this.products});

  @override
  List<DataGridRow> get rows => dataGridRows;

  void _build() => dataGridRows = products
      .map(
        (product) => DataGridRow(
          cells: [
            DataGridCell<int>(columnName: 'id', value: product.id),
            DataGridCell<String>(columnName: 'name', value: product.name),
            DataGridCell<String>(columnName: 'category', value: product.category),
            DataGridCell<String>(columnName: 'sku', value: product.sku),
            DataGridCell<String>(columnName: 'barcode', value: product.barcode),
            DataGridCell<double>(columnName: 'cost', value: product.cost),
            DataGridCell<double>(columnName: 'price', value: product.price),
            DataGridCell<String>(columnName: 'margin', value: '${product.margin}%'),
            DataGridCell<int>(columnName: 'qty', value: product.qty),
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
}
