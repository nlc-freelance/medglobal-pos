import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/uncounted_items/uncounted_items_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class CountedItemsDataGrid extends StatefulWidget {
  const CountedItemsDataGrid({super.key});

  @override
  State<CountedItemsDataGrid> createState() => _CountedItemsDataGridState();
}

class _CountedItemsDataGridState extends State<CountedItemsDataGrid> {
  List<StockTakeItem> _countedItems = <StockTakeItem>[];

  int? _filteredRowsCount;
  final _searchController = TextEditingController();

  late DataGridController _dataGridController;
  late CountedItemsDataSource _countedItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockTake = context.read<StockTakeCubit>().state.stockTake;

    _countedItems = stockTake.items?.where((item) => item.qtyCounted != null).toList() ?? [];
    _countedItemsDataSource = CountedItemsDataSource(_countedItems, context);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockTakeCubit, StockTakeState>(
      listener: (context, state) {
        _countedItemsDataSource._countedItems =
            state.stockTake.items?.where((item) => item.qtyCounted != null).toList() ?? [];

        _countedItemsDataSource.buildDataGridRows();
        _countedItemsDataSource.updateDataGridSource();
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UIText.heading5('Counted Items'),
                const UIHorizontalSpace(8),
                Text(
                  '(${_countedItemsDataSource.rows.length} total items)',
                  style: UIStyleText.hint.copyWith(fontSize: 14, color: UIColors.textGray),
                ),
              ],
            ),
            const Divider(color: UIColors.borderMuted),
            const UIVerticalSpace(8),
            DataGridToolbar(
              isDownloadable: true,
              padding: const EdgeInsets.only(bottom: 12),
              search: UISearchField(
                fieldWidth: 500.0,
                hint: 'Search variant name',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
                controller: _searchController,
                onChanged: (value) {
                  _countedItemsDataSource.clearFilters(columnName: 'variant_name');
                  if (value.isNotEmpty) {
                    _countedItemsDataSource.addFilter(
                      'variant_name',
                      FilterCondition(
                        value: value,
                        filterBehavior: FilterBehavior.stringDataType,
                        type: FilterType.contains,
                      ),
                    );
                  }
                  _countedItemsDataSource.updateDataGridSource();
                  setState(() => _filteredRowsCount = _countedItemsDataSource.effectiveRows.length);
                },
              ),
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
                    source: _countedItemsDataSource,
                    columns: DataGridUtil.getColumns(DataGridColumn.ST_COUNTED_ITEMS),
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
                        ? _filteredRowsCount! == 0 && _searchController.text.isNotEmpty
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

class CountedItemsDataSource extends DataGridSource {
  CountedItemsDataSource(List<StockTakeItem> itemsToOrder, BuildContext context) {
    _countedItems = itemsToOrder;
    _context = context;
    buildDataGridRows();
  }

  List<StockTakeItem> _countedItems = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _countedItems.map((item) => item.toDataGridRowCountedItems()).toList();

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
            child: UIText.bodyRegular(cell.value.toString()),
          ),
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
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Undo',
              iconBuilder: (isHover) => Assets.icons.undo.setColorOnHover(isHover),
              onClick: () {
                _context.read<StockTakeCubit>().undoCountedItem(id: id);
                _context.read<UncountedItemsCubit>().updateItem(id, null);
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
      int qtyExpected = dataGridRows[dataRowIndex].getCells()[4].value;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_counted', value: newQtyCounted);

      /// Compute new difference and update the value in the DataGridRows
      int newDiffrence = (newQtyCounted ?? 0) - (qtyExpected);
      dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<int>(columnName: 'difference', value: newDiffrence);

      _context.read<StockTakeCubit>().setCountedQuantityPerItem(
            id: _countedItems[dataRowIndex].id!,
            qty: newQtyCounted!,
            difference: newDiffrence,
          );
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
