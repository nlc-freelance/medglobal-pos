import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/stock_take_items_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CountedItemsDataGrid extends StatefulWidget {
  const CountedItemsDataGrid({super.key});

  @override
  State<CountedItemsDataGrid> createState() => _CountedItemsDataGridState();
}

class _CountedItemsDataGridState extends State<CountedItemsDataGrid> {
  final _debouncer = Debouncer(milliseconds: 500);

  List<StockTakeItem> stockTakeItems = [];
  int _rowsPerPage = 20;

  late TextEditingController _searchController;
  late DataGridController _dataGridController;
  late CountedItemsDataSource _countedItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _searchController = TextEditingController();

    customSelectionManager = CustomSelectionManager(_dataGridController);

    _countedItemsDataSource = CountedItemsDataSource([], context);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountedItemsListCubit, CountedItemsListState>(
      listener: (context, state) {
        if (state is StockTakeCountedItemsListLoaded) {
          _countedItemsDataSource = CountedItemsDataSource(state.data.stockTakeItems ?? [], context);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UIVerticalSpace(16),
            DataGridToolbar(
              padding: const EdgeInsets.only(bottom: 12),
              search: UISearchField(
                fieldWidth: 500.0,
                hint: 'Search variant name',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
                controller: _searchController,
                onChanged: (value) => _debouncer.run(
                  (() {
                    context.read<CountedItemsListCubit>().getItems(
                          id: context.read<StockTakeCubit>().state.stockTake.id!,
                          size: context.read<CountedItemsListFilterCubit>().state.size!,
                          search: value,
                        );
                    context.read<CountedItemsListFilterCubit>().setSearch(value);
                  }),
                ),
              ),
            ),
            if (state is StockTakeCountedItemsListError)
              Text(state.message)
            else if (state is StockTakeCountedItemsListLoaded) ...[
              Expanded(
                child: Container(
                  decoration: UIStyleContainer.topBorder,
                  child: ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.cellNavigationStyle,
                      child: SfDataGrid(
                        source: _countedItemsDataSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.ST_COUNTED_ITEMS),
                        controller: _dataGridController,
                        selectionManager: customSelectionManager,
                        navigationMode: GridNavigationMode.cell,
                        selectionMode: SelectionMode.single,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        editingGestureType: EditingGestureType.tap,
                        headerRowHeight: 38,
                        footer: state.data.totalCount == 0
                            ? Center(
                                child: UIText.bodyRegular(_searchController.text.isNotEmpty
                                    ? 'No results found for \'${_searchController.text}\''
                                    : 'No data available'),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.stockTakeItems?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<CountedItemsListFilterCubit, CountedItemsListFilterState>(
                      listenWhen: (previous, current) => previous.size != current.size,
                      listener: (context, filter) {
                        setState(() => _rowsPerPage = filter.size!);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<CountedItemsListFilterCubit>().setSize(value);

                          /// Go back to page 1 when:
                          ///  - total count is greater than the requested rows per page
                          ///  - requested rows per page will not have data anymore in the upcoming page to request
                          /// Example:
                          /// Previous list is 20 rows per page and have a total of 5 pages,
                          ///  when user now requests to have 100 rows per page, and the total page becomes less than 5,
                          ///  the next response will be an empty list.
                          /// To avoid, use the [totalPage], [totalCount] and the [rowsPerPage] selected to check
                          ///  if the page to pass in the request will be greater than the [totalPage] of our data.
                          /// If it is greater than the actual total page, then reset it to 1.
                          if (state.data.totalCount! <= value ||
                              state.data.totalPages! + 1 >
                                  ((state.data.totalCount! + (_rowsPerPage - 1)) / _rowsPerPage)) {
                            context.read<CountedItemsListCubit>().getItems(
                                  id: context.read<StockTakeCubit>().state.stockTake.id!,
                                  page: 1,
                                  size: _rowsPerPage,
                                  search: context.read<CountedItemsListFilterCubit>().state.search,
                                );
                          } else {
                            context.read<CountedItemsListCubit>().getItems(
                                  id: context.read<StockTakeCubit>().state.stockTake.id!,
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  search: context.read<CountedItemsListFilterCubit>().state.search,
                                );
                          }
                        },
                        menu: const [20, 50, 100],
                        menuAsString: (menu) => menu.toString(),
                      ),
                    ),
                    const UIHorizontalSpace(16),
                    UIText.labelMedium(
                      'Viewing ${(state.data.currentPage! - 1) * _rowsPerPage + 1} - ${state.data.currentPage! * _rowsPerPage > state.data.totalCount! ? state.data.totalCount! : state.data.currentPage! * _rowsPerPage} of ${state.data.totalCount} records',
                      color: UIColors.textLight,
                    ),
                    const Spacer(),
                    UIText.labelMedium(
                      'Page ${state.data.currentPage} of ${state.data.totalPages}',
                      color: UIColors.textLight,
                    ),
                    const UIHorizontalSpace(16),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != 1) {
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: 1,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.firstPage.svg(
                        colorFilter:
                            (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != 1) {
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.arrowLeft.svg(
                        colorFilter:
                            (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != state.data.totalPages) {
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.arrowRight.svg(
                        colorFilter: (state.data.currentPage == state.data.totalPages
                                ? UIColors.textMuted
                                : UIColors.textRegular)
                            .toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != state.data.totalPages) {
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.lastPage.svg(
                        colorFilter: (state.data.currentPage == state.data.totalPages
                                ? UIColors.textMuted
                                : UIColors.textRegular)
                            .toColorFilter,
                      ),
                    ),
                  ],
                ),
            ] else
              DataGridLoading(
                columns: DataGridUtil.getColumns(DataGridColumn.ST_COUNTED_ITEMS),
                source: _countedItemsDataSource = CountedItemsDataSource([], context),
              ),
          ],
        );
      },
    );
  }
}

class CountedItemsDataSource extends DataGridSource {
  CountedItemsDataSource(List<StockTakeItem> countedItems, BuildContext context) {
    _countedItems = countedItems;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<StockTakeItem> _countedItems = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _countedItems.map((item) => item.toDataGridRowCountedItems()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cellBuilder(cell.columnName, cell, row.getCells().first.value, dataGridRows.indexOf(row)),
        );
      }).toList(),
    );
  }

  Widget cellBuilder(String key, DataGridCell cell, int id, int rowIndex) => switch (key) {
        // 'qty_counted' => Container(
        //     width: double.infinity,
        //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //     decoration: BoxDecoration(
        //       color: UIColors.background,
        //       border: Border.all(color: UIColors.borderRegular),
        //       borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        //     ),
        //     child: UIText.bodyRegular(cell.value.toString()),
        //   ),
        'difference' => cell.value == 0
            ? UIText.bodyRegular(cell.value.toString())
            : Chip(
                label: Text(
                  cell.value.toString(),
                  style: UIStyleText.bodyRegular
                      .copyWith(color: cell.value! > 0 ? UIColors.completed : UIColors.cancelled),
                ),
                backgroundColor: cell.value! > 0 ? UIColors.completedBg : UIColors.cancelledBg,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: UIColors.transparent),
                ),
              ),
        'action' => BlocBuilder<StockTakeItemsCubit, StockTakeItemsState>(
            builder: (context, state) {
              if (state is StockTakeItemsLoading) {
                if (state.id == id) {
                  return const SizedBox(
                    height: 12,
                    width: 12,
                    child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                  );
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIButton.text(
                    state is StockTakeItemsError && state.id == id ? 'Retry' : 'Undo',
                    iconBuilder: (isHover) => Assets.icons.undo.setColorOnHover(isHover),
                    onClick: () => _context.read<StockTakeItemsCubit>().updateStockTakeItems(
                      StockItemUpdate.UNDO,
                      id: _context.read<StockTakeCubit>().state.stockTake.id!,
                      items: {id: null},
                    ),
                  ),
                  if (state is StockTakeItemsError && state.id == id)
                    Text(
                      state.message,
                      style: UIStyleText.subtitle.copyWith(color: UIColors.buttonDanger),
                    ),
                ],
              );
            },
          ),
        // LayoutBuilder(
        //           builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
        //             'Undo',
        //             iconBuilder: (isHover) => Assets.icons.undo.setColorOnHover(isHover),
        //             onClick: () {
        //               _context.read<StockTakeItemsCubit>().updateStockTakeItems(
        //                 StockItemUpdate.UNDO,
        //                 id: _context.read<StockTakeCubit>().state.stockTake.id!,
        //                 items: {id: null},
        //               );
        //             },
        //           ),
        //         ),
        _ => UIText.bodyRegular(cell.value.toString()),
      };

  // /// Helps to hold the new value of all editable widget.
  // /// Based on the new value we will commit the new value into the corresponding
  // /// [DataGridCell] on [onSubmitCell] method.
  // dynamic newCellValue;
  //
  // /// Help to control the editable text in [TextField] widget.
  // TextEditingController editingController = TextEditingController();
  //
  // @override
  // bool onCellBeginEdit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
  //   if (column.columnName == 'qty_counted') {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // @override
  // Future<void> onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) async {
  //   final dynamic oldValue = dataGridRow
  //           .getCells()
  //           .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
  //           .value ??
  //       '';
  //
  //   final int dataRowIndex = dataGridRows.indexOf(dataGridRow);
  //
  //   if (oldValue == newCellValue) return;
  //
  //   if (column.columnName == 'qty_counted') {
  //     final newQtyCounted = int.tryParse(newCellValue.toString());
  //     int qtyExpected = dataGridRows[dataRowIndex].getCells()[4].value;
  //
  //     dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
  //         DataGridCell<int>(columnName: 'qty_counted', value: newQtyCounted);
  //
  //     /// Compute new difference and update the value in the DataGridRows
  //     int newDiffrence = (newQtyCounted ?? 0) - (qtyExpected);
  //     dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<int>(columnName: 'difference', value: newDiffrence);
  //
  //     _context.read<StockTakeCubit>().setCountedQuantityPerItem(
  //           id: _countedItems[dataRowIndex].id!,
  //           qty: newQtyCounted!,
  //           difference: newDiffrence,
  //         );
  //   }
  // }
  //
  // @override
  // Widget? buildEditWidget(
  //     DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
  //   // Text going to display on editable widget
  //   final String displayText = dataGridRow
  //           .getCells()
  //           .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
  //           .value
  //           ?.toString() ??
  //       '';
  //
  //   // The new cell value must be reset.
  //   // To avoid committing the [DataGridCell] value that was previously edited
  //   // into the current non-modified [DataGridCell].
  //   newCellValue = null;
  //
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: TextField(
  //       controller: editingController..text = displayText,
  //       autofocus: true,
  //       cursorHeight: 15.0,
  //       style: UIStyleText.bodyRegular,
  //       decoration: const InputDecoration(
  //         contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //           borderSide: BorderSide(color: UIColors.textGray),
  //         ),
  //       ),
  //       onTapOutside: (event) => submitCell(),
  //       onChanged: (String value) => newCellValue = value.isNotEmpty ? value : null,
  //       onSubmitted: (String value) {
  //         /// Call [CellSubmit] callback to fire the canSubmitCell and
  //         /// onCellSubmit to commit the new value in single place.
  //         submitCell();
  //       },
  //     ),
  //   );
  // }
}
