import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/variant.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class VariantDataSource extends BaseDataSource {
  final List<Variant> variants;

  VariantDataSource({required this.variants});

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  void update() => notifyListeners();

  void _build() => dataGridRows = variants
      .map(
        (variant) => DataGridRow(
          cells: [
            DataGridCell<int>(columnName: 'id', value: variant.id),
            DataGridCell<String>(columnName: 'name', value: variant.name),
            // DataGridCell<String>(columnName: 'sku', value: variant.sku),
            DataGridCell<double>(columnName: 'price', value: variant.price),
            // DataGridCell<double>(columnName: 'cost', value: variant.cost),
            // DataGridCell<int>(columnName: 'qtyOnHand', value: variant.qtyOnHand),
            DataGridCell<int>(columnName: 'warningStock', value: variant.warningStock),
            DataGridCell<int>(columnName: 'idealStock', value: variant.idealStock),
            DataGridCell<String>(columnName: 'suppliers', value: variant.suppliers.toString()),
            const DataGridCell(columnName: 'action', value: null),
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
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // child: UIText.bodyRegular(cell.value.toString()),
          child: child(cell.columnName, cell),
        );
      }).toList(),
    );
  }

  Widget child(String key, DataGridCell cell) => switch (key) {
        'action' => UIButton.text(
            'Delete',
            iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
            onClick: () {
              // TODO: Add Product - Delete a variant
            },
          ),
        'suppliers' => Text(cell.value.toString().replaceAll(RegExp(r'[\[\]]'), '')),
        _ => UIText.bodyRegular(cell.value.toString()),
      };

  //       @override
  // void buildDataGridRow() => dataGridRows = variants
  //     .map((row) => DataGridRow(
  //         cells: DataGridColumn.suppliers
  //             .map((column) => DataGridCell<String>(
  //                   columnName: column.name,
  //                   value: row.get(column.name),
  //                 ))
  //             .toList()))
  //     .toList();
}


























// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class VariantDataSource extends BaseDataSource {
//   VariantDataSource({required super.rowData, required super.columnData});

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((cell) {
//         return Container(
//             alignment: Alignment.centerLeft,
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: child(cell.columnName, cell));
//       }).toList(),
//     );
//   }

//   Widget child(String key, DataGridCell cell) => switch (key) {
//         'action' => UIButton.text(
//             'Delete',
//             iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
//             onClick: () {
//               // TODO: Add Product - Delete a variant
//             },
//           ),
//         'suppliers' => Text(cell.value.toString().replaceAll(RegExp(r'[\[\]]'), '')),
//         _ => UIText.bodyRegular(cell.value),
//       };
// }
