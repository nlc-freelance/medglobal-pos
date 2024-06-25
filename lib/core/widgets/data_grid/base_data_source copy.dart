// import 'package:flutter/material.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// /// Base class for DataGridSource.
// /// Builds the DataGridRow with only String based cell values.
// class BaseDataSource extends DataGridSource {
//   final List<RowData> rowData;
//   final List<GridColumn> columnData;

//   BaseDataSource({required this.rowData, required this.columnData});

//   List<DataGridRow> _dataGridRows = [];

//   void _buildDataGridRow() {
//     _dataGridRows = rowData
//         .map((row) => DataGridRow(
//             cells: columnData
//                 .map((column) => DataGridCell<String>(
//                       columnName: column.columnName,
//                       value: DataGridColumn.customs.contains(column.columnName)
//                           ? null
//                           : row.data[column.columnName].toString(),
//                     ))
//                 .toList()))
//         .toList();
//   }

//   List<DataGridRow> buildDataGridRow() {
//     _buildDataGridRow();
//     return _dataGridRows;
//   }

//   void updateDataGrid() => notifyListeners();

//   @override
//   List<DataGridRow> get rows => _dataGridRows;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((cell) {
//         return Container(
//           alignment: Alignment.centerLeft,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: UIText.bodyRegular(cell.value),
//         );
//       }).toList(),
//     );
//   }

//     @override
//   Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
//     int startRowIndex = newPageIndex * rowsPerPage;
//     int endIndex = startRowIndex + rowsPerPage;

//     if (endIndex > orders.length) {
//       endIndex = orders.length - 1;
//     }

//     paginatedDataSource = List.from(
//         orders.getRange(startRowIndex, endIndex).toList(growable: false));
//     buildPaginatedDataGridRows();
//     notifyListeners();
//     return true;
//   }
// }

// class ColumnData {
//   final String name;
//   final String label;
//   final double? minWidth;

//   ColumnData(this.name, this.label, {this.minWidth});
// }

// class RowData {
//   final Map<String, dynamic> data;

//   RowData(this.data);
// }

// class DataGridUtil {
//   static List<GridColumn> getGridColumns(List<ColumnData> columns) => columns
//       .map<GridColumn>((column) => GridColumn(
//             visible: column.name != 'id',
//             columnName: column.name,
//             minimumWidth: column.minWidth ?? double.nan,
//             label: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 column.label,
//                 style: UIStyleText.labelSemiBold.copyWith(
//                   color: UIColors.textLight,
//                   fontWeight: FontWeight.w700,
//                   decoration: TextDecoration.none,
//                 ),
//               ),
//             ),
//           ))
//       .toList();
// }
