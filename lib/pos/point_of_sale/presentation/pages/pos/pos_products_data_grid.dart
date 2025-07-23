// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_list/pos_product_list_cubit.dart';
// import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:uuid/uuid.dart';

// class PosProductsDataGrid extends StatefulWidget {
//   const PosProductsDataGrid(this.items, {super.key});

//   final List<POSProduct> items;

//   @override
//   State<PosProductsDataGrid> createState() => _PosProductsDataGridState();
// }

// class _PosProductsDataGridState extends State<PosProductsDataGrid> {
//   late DataGridController _dataGridController;
//   late PosProductsDataSource _posProductsDataSource;

//   @override
//   void initState() {
//     super.initState();
//     _dataGridController = DataGridController();
//     _posProductsDataSource = PosProductsDataSource(widget.items, context);
//   }

//   @override
//   void dispose() {
//     _dataGridController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<PosProductListCubit, PosProductListState>(
//       listener: (context, state) {
//         if (state is POSProductListLoaded) {
//           _posProductsDataSource._items = state.products;

//           _posProductsDataSource.buildDataGridRows();
//           _posProductsDataSource.updateDataGridSource();
//         }
//       },
//       builder: (context, state) {
//         return Container(
//           decoration: UIStyleContainer.topBorder,
//           child: ClipRect(
//             clipper: HorizontalBorderClipper(),
//             child: SfDataGridTheme(
//               data: DataGridUtil.rowNavigationStyle,
//               child: SfDataGrid(
//                 source: _posProductsDataSource,
//                 columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
//                 controller: _dataGridController,
//                 loadMoreViewBuilder: state is POSProductListLoaded && !state.hasReachedMax
//                     ? (BuildContext context, LoadMoreRows load) {
//                         load();

//                         return Container(
//                           height: 60,
//                           color: UIColors.background,
//                           margin: const EdgeInsets.only(right: 12),
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                           alignment: Alignment.bottomCenter,
//                           child: const SizedBox(
//                             width: 12,
//                             height: 12,
//                             child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
//                           ),
//                         );
//                       }
//                     : null,
//                 rowHeight: 70,
//                 navigationMode: GridNavigationMode.row,
//                 columnWidthMode: ColumnWidthMode.fill,
//                 headerGridLinesVisibility: GridLinesVisibility.none,
//                 footerHeight: 100,
//                 footer: _posProductsDataSource.rows.isEmpty
//                     ? Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Assets.icons.cube.svg(),
//                             const UIVerticalSpace(12),
//                             context.read<PosProductSearchCubit>().state.search != null
//                                 ? UIText.labelMedium(
//                                     'No results found for \'${context.read<PosProductSearchCubit>().state.search}\'')
//                                 : UIText.labelMedium('No data available'),
//                           ],
//                         ),
//                       )
//                     : null,
//                 onCellTap: (details) {
//                   /// Skip if user taps on the header cells
//                   if (details.rowColumnIndex.rowIndex != 0) {
//                     final id = _posProductsDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
//                     final item = _posProductsDataSource._items.firstWhere((item) => item.id == id);

//                     context.read<OrderCubit>().addItem(TransactionItem(
//                           id: const Uuid().v4().hashCode,
//                           itemId: item.id,
//                           name: item.displayName,
//                           price: item.price,
//                         ));
//                   }
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class PosProductsDataSource extends DataGridSource {
//   PosProductsDataSource(List<POSProduct> items, BuildContext context) {
//     _items = items;
//     _context = context;
//     buildDataGridRows();
//   }

//   late BuildContext _context;

//   List<POSProduct> _items = [];

//   List<DataGridRow> dataGridRows = [];

//   void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRow()).toList();

//   void updateDataGridSource() => notifyListeners();

//   @override
//   List<DataGridRow> get rows => dataGridRows;

//   @override
//   Future<void> handleLoadMoreRows() async {
//     final search = _context.read<PosProductSearchCubit>().state.search;
//     _context.read<PosProductListCubit>().getPOSProducts(search: search);
//   }

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((cell) {
//         return Container(
//           alignment: Alignment.centerLeft,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: _buildCell(cell.columnName, cell, row.getCells().first.value),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildCell(String column, DataGridCell cell, int id) => switch (column) {
//         'product_name' => Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               /// Product thumbnail
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: UIColors.whiteBg,
//                 ),
//               ),
//               const UIHorizontalSpace(16),
//               Expanded(
//                 child: Text(
//                   cell.value,
//                   style: UIStyleText.bodyRegular.copyWith(fontSize: 15),
//                 ),
//               ),
//             ],
//           ),
//         _ => Text(
//             cell.runtimeType.toString().contains('double')
//                 ? (cell.value as double).toPesoString()
//                 : cell.value.toString(),
//             style: UIStyleText.bodyRegular.copyWith(fontSize: 15),
//           ),
//       };
// }
