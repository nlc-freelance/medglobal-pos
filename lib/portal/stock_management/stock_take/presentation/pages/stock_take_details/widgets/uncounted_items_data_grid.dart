import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/uncounted_items_draft/uncounted_items_draft_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/stock_take_items_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/uncounted_items_list/uncounted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/uncounted_items_list/uncounted_items_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UncountedItemsDataGrid extends StatefulWidget {
  const UncountedItemsDataGrid({super.key});

  @override
  State<UncountedItemsDataGrid> createState() => _UncountedItemsDataGridState();
}

class _UncountedItemsDataGridState extends State<UncountedItemsDataGrid> with SingleTickerProviderStateMixin {
  final _debouncer = Debouncer(milliseconds: 500);

  List<StockTakeItem> stockTakeItems = [];
  int _rowsPerPage = 20;

  late TextEditingController _searchController;
  late DataGridController _dataGridController;
  late UncountedItemsDataSource _uncountedItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _searchController = TextEditingController();

    customSelectionManager = CustomSelectionManager(_dataGridController);

    _uncountedItemsDataSource = UncountedItemsDataSource([], context);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<bool> _handleUnsavedChangesOnPageNavigate() {
    final Completer<bool> completer = Completer<bool>();

    for (var item in (_uncountedItemsDataSource._uncountedItems)) {
      if (context.read<UncountedItemsDraftCubit>().state.uncountedItems.entries.any((entry) => entry.key == item.id)) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Dialog(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.4,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              decoration: const BoxDecoration(
                color: UIColors.background,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UIVerticalSpace(8),
                  UIText.heading6('Unconfirmed Counted Quantities'),
                  const Divider(color: UIColors.borderMuted),
                  const UIVerticalSpace(8),
                  UIText.bodyRegular(
                    'You have items with unconfirmed counted quantities on this page. Please make sure to confirm them before leaving this page to prevent losing any of your entered data.',
                  ),
                  const UIVerticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      UIButton.outlined('Discard changes and navigate', onClick: () {
                        context.read<UncountedItemsDraftCubit>().reset();
                        Navigator.pop(context);
                        completer.complete(true);
                      }),
                      const UIHorizontalSpace(8),
                      UIButton.filled('Stay and review these items', onClick: () {
                        Navigator.pop(context);
                        completer.complete(false);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
        return completer.future;
      }
    }
    return Future.value(true);
  }

  void _onSearch(String value) {
    context.read<UncountedItemsListCubit>().getItems(
          id: context.read<StockTakeCubit>().state.stockTake.id!,
          size: context.read<UncountedItemsListFilterCubit>().state.size!,
          search: value,
        );
    context.read<UncountedItemsListFilterCubit>().setSearch(value);
  }

  void _onNextPage(StockTakeUncountedItemsListLoaded state) {
    if (state.data.currentPage != state.data.totalPages) {
      context.read<UncountedItemsListCubit>().getItems(
            id: context.read<StockTakeCubit>().state.stockTake.id!,
            page: state.data.currentPage! + 1,
            size: _rowsPerPage,
            search: context.read<UncountedItemsListFilterCubit>().state.search,
          );
    }
  }

  void _onPreviousPage(StockTakeUncountedItemsListLoaded state) {
    if (state.data.currentPage != 1) {
      context.read<UncountedItemsListCubit>().getItems(
            id: context.read<StockTakeCubit>().state.stockTake.id!,
            page: state.data.currentPage! - 1,
            size: _rowsPerPage,
            search: context.read<UncountedItemsListFilterCubit>().state.search,
          );
    }
  }

  void _onFirstPage(StockTakeUncountedItemsListLoaded state) {
    if (state.data.currentPage != 1) {
      context.read<UncountedItemsListCubit>().getItems(
            id: context.read<StockTakeCubit>().state.stockTake.id!,
            page: 1,
            size: _rowsPerPage,
            search: context.read<UncountedItemsListFilterCubit>().state.search,
          );
    }
  }

  void _onLastPage(StockTakeUncountedItemsListLoaded state) {
    if (state.data.currentPage != state.data.totalPages) {
      context.read<UncountedItemsListCubit>().getItems(
            id: context.read<StockTakeCubit>().state.stockTake.id!,
            page: state.data.totalPages!,
            size: _rowsPerPage,
            search: context.read<UncountedItemsListFilterCubit>().state.search,
          );
    }
  }

  void _onChangeRowsPerPage(StockTakeUncountedItemsListLoaded state, int value) {
    setState(() => _rowsPerPage = value);
    context.read<UncountedItemsListFilterCubit>().setSize(value);

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
        state.data.totalPages! + 1 > ((state.data.totalCount! + (_rowsPerPage - 1)) / _rowsPerPage)) {
      context.read<UncountedItemsListCubit>().getItems(
            id: context.read<StockTakeCubit>().state.stockTake.id!,
            page: 1,
            size: _rowsPerPage,
            search: context.read<UncountedItemsListFilterCubit>().state.search,
          );
    } else {
      context.read<UncountedItemsListCubit>().getItems(
            id: context.read<StockTakeCubit>().state.stockTake.id!,
            page: state.data.currentPage!,
            size: _rowsPerPage,
            search: context.read<UncountedItemsListFilterCubit>().state.search,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StockTakeItemsCubit, StockTakeItemsState>(
      listener: (context, state) {
        if (state is StockTakeItemsSuccess) {
          _searchController.text = Strings.empty;
          ToastNotification.success(context, 'The stock item has been successfully updated!');
          context.read<UncountedItemsListCubit>().getItems(id: context.read<StockTakeCubit>().state.stockTake.id!);
          context.read<CountedItemsListCubit>().getItems(id: context.read<StockTakeCubit>().state.stockTake.id!);
        }
        if (state is StockTakeItemsNullCountedQtyError) {
          Timer(const Duration(seconds: 3), () => context.read<StockTakeItemsCubit>().reset());
        }
      },
      child: BlocConsumer<UncountedItemsListCubit, UncountedItemsListState>(
        listener: (context, state) {
          if (state is StockTakeUncountedItemsListLoaded) {
            _uncountedItemsDataSource = UncountedItemsDataSource(state.data.stockTakeItems ?? [], context);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UIVerticalSpace(16),
              UISearchField(
                fieldWidth: 500.0,
                hint: 'Search variant name',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
                controller: _searchController,
                onChanged: (value) {
                  _debouncer.run(
                    (() async {
                      final goSearch = await _handleUnsavedChangesOnPageNavigate();
                      if (goSearch) _onSearch(value);
                    }),
                  );
                },
              ),
              const UIVerticalSpace(16),
              if (state is StockTakeUncountedItemsListError)
                Text(state.message)
              else if (state is StockTakeUncountedItemsListLoaded) ...[
                Expanded(
                  child: Container(
                    decoration: UIStyleContainer.topBorder,
                    child: ClipRect(
                      clipper: HorizontalBorderClipper(),
                      child: SfDataGridTheme(
                        data: DataGridUtil.cellNavigationStyle,
                        child: SfDataGrid(
                          source: _uncountedItemsDataSource,
                          columns: DataGridUtil.getColumns(DataGridColumn.ST_UNCOUNTED_ITEMS),
                          controller: _dataGridController,
                          selectionManager: customSelectionManager,
                          allowEditing: true,
                          editingGestureType: EditingGestureType.tap,
                          navigationMode: GridNavigationMode.cell,
                          selectionMode: SelectionMode.single,
                          columnWidthMode: ColumnWidthMode.fill,
                          headerGridLinesVisibility: GridLinesVisibility.none,
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
                      BlocListener<UncountedItemsListFilterCubit, UncountedItemsListFilterState>(
                        listenWhen: (previous, current) => previous.size != current.size,
                        listener: (context, filter) {
                          setState(() => _rowsPerPage = filter.size!);
                        },
                        child: UIPopupMenuButton.textIcon(
                          title: '$_rowsPerPage rows',
                          iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                          onSelect: (value) async {
                            final changeRowsPerPage = await _handleUnsavedChangesOnPageNavigate();
                            if (changeRowsPerPage) _onChangeRowsPerPage(state, value);
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
                        onPressed: () async {
                          final navToFirstPage = await _handleUnsavedChangesOnPageNavigate();
                          if (navToFirstPage) _onFirstPage(state);
                        },
                        icon: Assets.icons.firstPage.svg(
                          colorFilter:
                              (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final navToPreviousPage = await _handleUnsavedChangesOnPageNavigate();
                          if (navToPreviousPage) _onPreviousPage(state);
                        },
                        icon: Assets.icons.arrowLeft.svg(
                          colorFilter:
                              (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final navToNextPage = await _handleUnsavedChangesOnPageNavigate();
                          if (navToNextPage) _onNextPage(state);
                        },
                        icon: Assets.icons.arrowRight.svg(
                          colorFilter: (state.data.currentPage == state.data.totalPages
                                  ? UIColors.textMuted
                                  : UIColors.textRegular)
                              .toColorFilter,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final navToLastPage = await _handleUnsavedChangesOnPageNavigate();
                          if (navToLastPage) _onLastPage(state);
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
                  columns: DataGridUtil.getColumns(DataGridColumn.ST_UNCOUNTED_ITEMS),
                  source: _uncountedItemsDataSource = UncountedItemsDataSource([], context),
                )
            ],
          );
        },
      ),
    );
  }
}

class UncountedItemsDataSource extends DataGridSource {
  UncountedItemsDataSource(List<StockTakeItem> uncountedItems, BuildContext context) {
    _uncountedItems = uncountedItems;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<StockTakeItem> _uncountedItems = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() =>
      dataGridRows = _uncountedItems.map((item) => addDraftValue(item).toDataGridRowUncountedItems()).toList();

  /// Save counted quantities as draft for when user do not confirm it right away
  StockTakeItem addDraftValue(StockTakeItem item) {
    final draftItems = _context.read<UncountedItemsDraftCubit>().state.uncountedItems;
    StockTakeItem stockTakeItem = item;

    for (var draft in draftItems.entries) {
      final draftId = draft.key;
      final draftQtyCounted = draft.value;

      if (item.id == draftId) stockTakeItem = item.copyWith(qtyCounted: draftQtyCounted);
    }

    return stockTakeItem;
  }

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
        'qty_counted' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: UIText.bodyRegular(
              (cell.value ?? '0').toString(),
              color: cell.value == null ? UIColors.textMuted : UIColors.textRegular,
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
                    state is StockTakeItemsError && state.id == id ? 'Retry' : 'Confirm',
                    iconBuilder: (isHover) => Assets.icons.send.setColorOnHover(isHover),
                    onClick: () {
                      final newQtyCounted = dataGridRows[rowIndex].getCells()[4].value;

                      _context.read<StockTakeItemsCubit>().updateStockTakeItems(
                        StockItemUpdate.CONFIRM,
                        id: _context.read<StockTakeCubit>().state.stockTake.id!,
                        items: {id: newQtyCounted},
                      );
                    },
                  ),
                  if (state is StockTakeItemsNullCountedQtyError && state.id == id)
                    Text(
                      state.message,
                      style: UIStyleText.subtitle.copyWith(color: UIColors.warning),
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
        _ => UIText.bodyRegular(cell.value.toString()),
      };

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  bool onCellBeginEdit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    if (column.columnName == 'qty_counted') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) async {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
            .value ??
        '';

    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

    if (oldValue == newCellValue) return;

    if (column.columnName == 'qty_counted') {
      final newQtyCounted = int.tryParse(newCellValue.toString());

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_counted', value: newQtyCounted);

      final stockItemId = _uncountedItems[dataRowIndex].id!;

      if (newQtyCounted != null) {
        _context.read<UncountedItemsDraftCubit>().addCountedItemDraft(stockItemId, newQtyCounted);
      } else {
        _context.read<UncountedItemsDraftCubit>().removeCountedItemFromDraft(stockItemId);
      }
    }
  }

  @override
  Widget? buildEditWidget(
      DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
            .value
            ?.toString() ??
        '';

    newCellValue = displayText;

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: editingController..text = displayText,
        autofocus: true,
        cursorHeight: 15.0,
        style: UIStyleText.bodyRegular,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: UIColors.textGray),
          ),
        ),
        onTapOutside: (event) => submitCell(),
        onChanged: (String value) => newCellValue = value.isNotEmpty ? value : null,
        onSubmitted: (String value) {
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
          submitCell();
        },
      ),
    );
  }
}
