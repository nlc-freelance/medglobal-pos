// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:medglobal_admin_portal/core/constants/lists.dart';
// import 'package:medglobal_admin_portal/core/constants/sizes.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class PaginatedDataGrid extends StatefulWidget {
//   const PaginatedDataGrid({Key? key}) : super(key: key);

//   @override
//   _PaginatedDataGrid createState() => _PaginatedDataGrid();
// }

// int _rowsPerPage = 10;

// class _PaginatedDataGrid extends State<PaginatedDataGrid> {
//   int _rowsPerPage = 10;
//   List<Product> employees = <Product>[];
//   late ProductDataSource productDataSource;
//   double datapagerHeight = 70.0;

//   @override
//   void initState() {
//     super.initState();
//     super.initState();
//     employees = productList;
//     productDataSource = ProductDataSource(employeeData: employees);
//   }

//   updateWidget() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SfDataGridTheme(
//           data: StyleDataGrid.base,
//           child: SfDataGrid(
//             source: productDataSource,
//             columnWidthMode: ColumnWidthMode.fill,
//             shrinkWrapRows: true,
//             // onQueryRowHeight: (details) => _source.runtimeType != BaseDataSource
//             //     ? details.getIntrinsicRowHeight(details.rowIndex)
//             //     : Sizes.rowHeight,
//             rowHeight: Sizes.rowHeight,
//             headerRowHeight: Sizes.headerHeight,
//             // columnWidthMode: ColumnWidthMode.fill,
//             headerGridLinesVisibility: GridLinesVisibility.none,
//             gridLinesVisibility: GridLinesVisibility.horizontal,
//             columns: <GridColumn>[
//               GridColumn(
//                   columnName: 'orderID',
//                   label: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         'Order ID',
//                         overflow: TextOverflow.ellipsis,
//                       ))),
//               GridColumn(
//                   columnName: 'customerID',
//                   label: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Customer Name',
//                         overflow: TextOverflow.ellipsis,
//                       ))),
//               GridColumn(
//                   columnName: 'orderDate',
//                   label: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         'Order Date',
//                         overflow: TextOverflow.ellipsis,
//                       ))),
//               GridColumn(
//                   columnName: 'freight',
//                   label: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16.0),
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Freight',
//                         overflow: TextOverflow.ellipsis,
//                       )))
//             ],
//           ),
//         ),
//         Container(
//             color: Colors.amber,
//             child: SfDataPager(
//               delegate: productDataSource,
//               availableRowsPerPage: [10, 20, 30],
//               onRowsPerPageChanged: (int? rowsPerPage) {
//                 setState(() {
//                   _rowsPerPage = rowsPerPage!;
//                   productDataSource.updateDataGriDataSource();
//                 });
//               },
//               pageCount: ((employees.length / _rowsPerPage).ceil()).toDouble(),
//             )),
//       ],
//     );
//   }
// }

// class ProductDataSource extends DataGridSource {
//   ProductDataSource({required List<Product> employeeData}) {
//     _employeeData = employeeData;
//     _paginatedRows = employeeData;
//     buildDataGridRow();
//   }

//   void buildDataGridRow() {
//     _employeeDataGridRows = _paginatedRows
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<String>(columnName: 'id', value: e.id.toString()),
//               DataGridCell<String>(columnName: 'name', value: e.name),
//               DataGridCell<String>(columnName: 'designation', value: e.category),
//               DataGridCell<String>(columnName: 'salary', value: e.sku),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _employeeDataGridRows = [];
//   List<Product> _paginatedRows = [];
//   List<Product> _employeeData = [];

//   @override
//   List<DataGridRow> get rows => _employeeDataGridRows;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }

//   @override
//   Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) {
//     final int _startIndex = (newPageIndex * _rowsPerPage);
//     int _endIndex = (_startIndex + _rowsPerPage);
//     if (_endIndex > _employeeData.length) {
//       _endIndex = _employeeData.length;
//     }

//     /// Get a particular range from the sorted collection.
//     if (_startIndex < _employeeData.length && _endIndex <= _employeeData.length) {
//       _paginatedRows = _employeeData.getRange(_startIndex, _endIndex).toList();
//     } else {
//       _paginatedRows = <Product>[];
//     }
//     buildDataGridRow();
//     notifyListeners();
//     return Future<bool>.value(true);
//   }

//   void updateDataGriDataSource() {
//     notifyListeners();
//   }
// }
