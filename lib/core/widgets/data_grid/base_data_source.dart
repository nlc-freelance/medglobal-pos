import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// Base class for DataGridSource.
/// Builds the DataGridRow with only String based cell values.
abstract class BaseDataSource extends DataGridSource {
  // final List<RowData> rowData;
  // final List<GridColumn> columnData;
  // final int rowsPerPage;

  BaseDataSource(
      // required this.rowData,
      // required this.columnData,
      // this.rowsPerPage = 20,
      );

  List<DataGridRow> dataGridRows = [];
  // List<DataGridRow> _dataGridRows = [];

  // List<RowData> _paginatedRows = [];

  // void _buildDataGridRow();

  // void _buildDataGridRow() {
  //   _dataGridRows = rowData
  //       .map((row) => DataGridRow(
  //           cells: columnData
  //               .map((column) => DataGridCell<String>(
  //                     columnName: column.columnName,
  //                     value: DataGridColumn.customs.contains(column.columnName)
  //                         ? null
  //                         : row.data[column.columnName].toString(),
  //                   ))
  //               .toList()))
  //       .toList();
  // }

  List<DataGridRow> build();

  // List<DataGridRow> buildDataGridRow() {
  //   _buildDataGridRow();
  //   return _dataGridRows;
  // }

  // @override
  // List<DataGridRow> get rows => _dataGridRows;

  // @override
  // DataGridRowAdapter buildRow(DataGridRow row) {
  //   return DataGridRowAdapter(
  //     cells: row.getCells().map<Widget>((cell) {
  //       return Container(
  //         alignment: Alignment.centerLeft,
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //         child: UIText.bodyRegular(cell.value),
  //       );
  //     }).toList(),
  //   );
  // }

  // @override
  // Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
  //   final int startIndex = (newPageIndex * rowsPerPage);
  //   int endIndex = (startIndex + rowsPerPage);
  //   if (endIndex > rowData.length) {
  //     endIndex = rowData.length;
  //   }

  //   /// Get a particular range from the sorted collection.
  //   if (startIndex < rowData.length && endIndex <= rowData.length) {
  //     _paginatedRows = rowData.getRange(startIndex, endIndex).toList();
  //   } else {
  //     _paginatedRows = [];
  //   }
  //   buildDataGridRow();
  //   notifyListeners();
  //   return Future<bool>.value(true);
  // }

  // void updateDataGrid() => notifyListeners();
  void update();
}
