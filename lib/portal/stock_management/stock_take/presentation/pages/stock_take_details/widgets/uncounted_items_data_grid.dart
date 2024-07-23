import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/uncounted_items/uncounted_items_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class UncountedItemsDataGrid extends StatefulWidget {
  const UncountedItemsDataGrid({super.key});

  @override
  State<UncountedItemsDataGrid> createState() => _UncountedItemsDataGridState();
}

class _UncountedItemsDataGridState extends State<UncountedItemsDataGrid> {
  List<StockTakeItem> _uncountedItems = <StockTakeItem>[];

  int? _filteredRowsCount;
  final _searchController = TextEditingController();

  late DataGridController _dataGridController;
  late UncountedItemsDataSource _uncountedItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockTake = context.read<StockTakeCubit>().state.stockTake;

    _uncountedItems = stockTake.items?.where((item) => item.qtyCounted == null).toList() ?? [];
    _uncountedItemsDataSource = UncountedItemsDataSource(_uncountedItems, context);

    context.read<UncountedItemsCubit>().setUncountedItemsTemp(_uncountedItems);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  StockTakeItem mapCountedQtyFromDraft(StockTakeItem item) {
    final draftItems = context.read<UncountedItemsCubit>().state.uncountedItems?.toList() ?? [];

    for (var draftItem in draftItems) {
      if (draftItem.id == item.id && draftItem.qtyCounted != null) {
        return item.copyWith(qtyCounted: draftItem.qtyCounted);
      }
    }
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockTakeCubit, StockTakeState>(
      listener: (context, state) {
        _uncountedItemsDataSource._uncountedItems = state.stockTake.items
                ?.where((item) => item.qtyCounted == null)
                .toList()

                /// draft - set input counted qty of items from the temp list
                /// (happens when input, input input instead of input confirm, input confirm)
                .map((e) => mapCountedQtyFromDraft(e))
                .toList() ??
            [];

        _uncountedItemsDataSource.buildDataGridRows();
        _uncountedItemsDataSource.updateDataGridSource();
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UIText.heading5('Uncounted Items'),
                const UIHorizontalSpace(8),
                Text(
                  '(${_uncountedItemsDataSource.rows.length} total items)',
                  style: UIStyleText.hint.copyWith(fontSize: 14, color: UIColors.textGray),
                ),
              ],
            ),
            const Divider(color: UIColors.borderMuted),
            const UIVerticalSpace(8),
            DataGridToolbar(
              isDownloadable: true,
              isImportCSV: true,
              padding: const EdgeInsets.only(bottom: 12),
              searchPlaceholder: 'Search variant name',
              searchController: _searchController,
              onChanged: (value) {
                _uncountedItemsDataSource.clearFilters(columnName: 'variant_name');
                if (value.isNotEmpty) {
                  _uncountedItemsDataSource.addFilter(
                    'variant_name',
                    FilterCondition(
                      value: value,
                      filterBehavior: FilterBehavior.stringDataType,
                      type: FilterType.contains,
                    ),
                  );
                }
                _uncountedItemsDataSource.updateDataGridSource();
                setState(() => _filteredRowsCount = _uncountedItemsDataSource.effectiveRows.length);
              },
            ),
            if (_searchController.text.isNotEmpty)
              Text(
                '(${(_filteredRowsCount ?? 0).toString()}) Search results found for \'${_searchController.text}\'',
                style: UIStyleText.hint.copyWith(fontSize: 14, color: UIColors.textGray),
              ),
            const UIVerticalSpace(10),
            Container(
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
                    shrinkWrapRows: true,
                    allowEditing: true,
                    navigationMode: GridNavigationMode.cell,
                    selectionMode: SelectionMode.single,
                    columnWidthMode: ColumnWidthMode.fill,
                    headerGridLinesVisibility: GridLinesVisibility.none,
                    editingGestureType: EditingGestureType.tap,
                    footer: _filteredRowsCount != null
                        ? _filteredRowsCount! == 0
                            ? Center(child: UIText.bodyRegular('No results found'))
                            : null
                        : null,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class UncountedItemsDataSource extends DataGridSource {
  UncountedItemsDataSource(List<StockTakeItem> itemsToOrder, BuildContext context) {
    _uncountedItems = itemsToOrder;
    _context = context;
    buildDataGridRows();
  }

  List<StockTakeItem> _uncountedItems = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _uncountedItems.map((item) => item.toDataGridRowUncountedItems()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

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
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Confirm',
              iconBuilder: (isHover) => Assets.icons.send.setColorOnHover(isHover),
              onClick: () {
                int newQtyCounted = dataGridRows[rowIndex].getCells()[4].value ?? 0;
                int qtyExpected = dataGridRows[rowIndex].getCells()[3].value;
                int newDiffrence = (newQtyCounted) - (qtyExpected);

                context.read<StockTakeCubit>().setCountedQuantityPerItem(
                      id: id,
                      qty: newQtyCounted,
                      difference: newDiffrence,
                    );
              },
            ),
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

    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }

    if (column.columnName == 'qty_counted') {
      final newQtyCounted = int.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_counted', value: newQtyCounted);

      /// Save the inputs on qty_counted field in a temp list so we can put it back to the data grid later after updating the rows
      _context.read<UncountedItemsCubit>().updateItem(_uncountedItems[dataRowIndex].id!, newQtyCounted ?? 0);
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

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: editingController..text = displayText,
        autofocus: true,
        cursorHeight: 15.0,
        style: UIStyleText.bodyRegular,
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
