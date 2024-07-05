// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
// import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/widgets/selected_products_toolbar.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class DataGridSelection extends StatefulWidget {
//   const DataGridSelection({super.key, required this.data});

//   final List<Product> data;

//   @override
//   State<DataGridSelection> createState() => _DataGridSelectionState();
// }

// bool? isHeaderCheckboxState = false;

// class _DataGridSelectionState extends State<DataGridSelection> with DataGridInitMixin {
//   late DataGridController _controller;
//   late ProductDataSource _source;
//   late List<GridColumn> _columns;

//   List<Product> _data = <Product>[];

//   @override
//   void initState() {
//     super.initState();
//     _controller = DataGridController();
//     _data = widget.data;
//     _columns = getColumns;

//     stateSetter(fn) {
//       setState(fn);
//     }

//     _source = ProductDataSource(stateSetter, _data, _controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         if (_controller.selectedRows.isNotEmpty) SelectedProductsToolbar(_controller),
//         SfDataGridTheme(
//           data: StyleDataGrid.rowNavigation,
//           child: ClipRect(
//             clipper: HorizontalBorderClipper(),
//             child: SfDataGrid(
//               source: _source,
//               columnWidthMode: ColumnWidthMode.fill,
//               controller: _controller,
//               columns: _columns,
//               selectionMode: SelectionMode.multiple,
//               rowHeight: Sizes.rowHeight,
//               allowColumnsDragging: true,
//               headerRowHeight: Sizes.headerHeight,
//               headerGridLinesVisibility: GridLinesVisibility.none,
//               gridLinesVisibility: GridLinesVisibility.horizontal,
//               onCellTap: (details) {
//                 // AppRouter.router.goNamed(SideMenuTreeItem.newProduct.name);
//                 int id = _source.rows[details.rowColumnIndex.rowIndex - 1].getCells().elementAt(1).value;
//                 print(id);
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => const DetailsPage()),
//                 // );
//               },
//               onSelectionChanging: (addedRows, removedRows) {
//                 // To update the current cell.
//                 setState(() {});

//                 // To prevent the selection when tap on the row.
//                 return false;
//               },
//               columnDragFeedbackBuilder: (context, column) => Container(
//                 height: Sizes.headerHeight,
//                 width: column.minimumWidth,
//                 decoration: const BoxDecoration(
//                   color: UIColors.background,
//                   border: Border.fromBorderSide(BorderSide(color: UIColors.borderRegular, width: 1.0)),
//                   borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                 ),
//                 child: column.label,
//               ),
//               onColumnDragging: (DataGridColumnDragDetails details) {
//                 if (details.action == DataGridColumnDragAction.dropped && details.to != null) {
//                   final GridColumn rearrangeColumn = _columns[details.from];

//                   _columns.removeAt(details.from);
//                   _columns.insert(details.to!, rearrangeColumn);

//                   _source.buildDataGridRows(_data);
//                   _source.updateDataGrid();

//                   /// DataGrid with [showCheckbox] does not maintain the selected rows upon column drag and drops.
//                   /// Column drag and drop requires rebuilding of the DataGridRow in order to display the data correctly.
//                   /// To maintain the selection even after re-arranging the columns, store the selected data IDs in state.
//                   /// Then use it to get the rows and assign to the [selectedRows] of the DataGridController.
//                   // if (widget.showCheckbox) {
//                   //   final selectedRows =
//                   //       _source.rows.where((row) => widget.selectedRowDataIDs!.contains(row.id)).toList();
//                   //   _controller.selectedRows = selectedRows;
//                   // }
//                 }
//                 return true;
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   List<GridColumn> get getColumns {
//     return <GridColumn>[
//       GridColumn(
//           minimumWidth: 80,
//           columnWidthMode: ColumnWidthMode.fitByCellValue,
//           columnName: 'CheckBox',
//           label: Container(
//               width: 80,
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               alignment: Alignment.centerLeft,
//               child: Checkbox(
//                 tristate: true,
//                 visualDensity: VisualDensity.compact,
//                 value: isHeaderCheckboxState,
//                 onChanged: (value) {
//                   if (value == true && isHeaderCheckboxState == false) {
//                     for (var element in _source.datagridRows) {
//                       element.getCells()[0] = const DataGridCell<bool>(columnName: 'CheckBox', value: true);
//                     }
//                     _controller.selectedRows = _source.rows;
//                     isHeaderCheckboxState = value;
//                   } else if (value == null && isHeaderCheckboxState == true) {
//                     for (var element in _source.datagridRows) {
//                       element.getCells()[0] = const DataGridCell<bool>(columnName: 'CheckBox', value: false);
//                     }
//                     _controller.selectedRows = [];
//                     isHeaderCheckboxState = false;
//                   } else {
//                     for (var element in _source.datagridRows) {
//                       element.getCells()[0] = const DataGridCell<bool>(columnName: 'CheckBox', value: true);
//                     }
//                     _controller.selectedRows = _source.rows;
//                     isHeaderCheckboxState = true;
//                   }
//                   // To update the datagrid rows.
//                   _source.updateDataGrid();
//                   // To update the datagrid view.
//                   setState(() {});
//                 },
//               ))),
//       GridColumn(
//           columnWidthMode: ColumnWidthMode.fill,
//           visible: false,
//           columnName: 'id',
//           label: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'ID',
//                 style: UIStyleText.labelSemiBold.copyWith(
//                   color: UIColors.textLight,
//                   fontWeight: FontWeight.w700,
//                   decoration: TextDecoration.none,
//                 ),
//               ))),
//       GridColumn(
//           columnWidthMode: ColumnWidthMode.fill,
//           columnName: 'Name',
//           label: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Name',
//                 style: UIStyleText.labelSemiBold.copyWith(
//                   color: UIColors.textLight,
//                   fontWeight: FontWeight.w700,
//                   decoration: TextDecoration.none,
//                 ),
//               ))),
//       GridColumn(
//           columnWidthMode: ColumnWidthMode.fill,
//           columnName: 'Category',
//           label: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Category',
//                 style: UIStyleText.labelSemiBold.copyWith(
//                   color: UIColors.textLight,
//                   fontWeight: FontWeight.w700,
//                   decoration: TextDecoration.none,
//                 ),
//               ))),
//       GridColumn(
//           columnWidthMode: ColumnWidthMode.fill,
//           columnName: 'Created At',
//           label: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Created At',
//                 style: UIStyleText.labelSemiBold.copyWith(
//                   color: UIColors.textLight,
//                   fontWeight: FontWeight.w700,
//                   decoration: TextDecoration.none,
//                 ),
//               ))),
//     ];
//   }
// }

// class ProductDataSource extends DataGridSource {
//   ProductDataSource(this._setState, List<Product> products, this.dataGridController) {
//     buildDataGridRows(products);
//   }

//   List<DataGridRow> datagridRows = [];

//   final StateSetter _setState;

//   DataGridController dataGridController;

//   @override
//   List<DataGridRow> get rows => datagridRows;

//   void buildDataGridRows(List<Product> products) {
//     datagridRows = products
//         .map<DataGridRow>((product) => DataGridRow(cells: [
//               DataGridCell<bool>(columnName: 'CheckBox', value: product.isSelected),
//               DataGridCell<int>(columnName: 'ID', value: product.id),
//               DataGridCell<String>(columnName: 'Name', value: product.name),
//               DataGridCell<String>(columnName: 'Category', value: product.category?.name ?? ''),
//               DataGridCell<String>(columnName: 'Created At', value: DateFormat.yMd().format(product.createdAt!)),
//             ]))
//         .toList();
//   }

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return e.columnName == 'CheckBox'
//           ? Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Checkbox(
//                 value: e.value,
//                 onChanged: (value) {
//                   int index = rows.indexOf(row);

//                   datagridRows[index].getCells()[0] = DataGridCell<bool>(columnName: 'CheckBox', value: value);
//                   if (value == true) {
//                     dataGridController.selectedRow = row;
//                   } else if (value == false) {
//                     List<DataGridRow> newSelectedRows = dataGridController.selectedRows.toList();
//                     // To remove the corresponding row from the selectedRows list.
//                     newSelectedRows.remove(row);
//                     // To update the selectedRows list.
//                     dataGridController.selectedRows = newSelectedRows;
//                   }
//                   if (dataGridController.selectedRows.isEmpty) {
//                     isHeaderCheckboxState = false;
//                   } else if (rows.length != dataGridController.selectedRows.length) {
//                     isHeaderCheckboxState = null;
//                   } else if (rows.length == dataGridController.selectedRows.length) {
//                     isHeaderCheckboxState = true;
//                   }
//                   // To update the datagrid rows.
//                   notifyListeners();
//                   // To update the datagrid view.
//                   _setState(() {});
//                 },
//               ),
//             )
//           : Container(
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: e.columnName == 'Name'
//                   ? HoverBuilder(
//                       builder: (isHover) => InkWell(
//                             onTap: () => print(e.value),
//                             child: UIText.bodyRegular(e.value.toString(),
//                                 color: isHover ? UIColors.primary : UIColors.textRegular),
//                           ))
//                   : Text(e.value.toString()),
//             );
//     }).toList());
//   }

//   void updateDataGrid() {
//     notifyListeners();
//   }
// }
