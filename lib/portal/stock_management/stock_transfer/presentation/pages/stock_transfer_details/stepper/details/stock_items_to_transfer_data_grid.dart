import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/autocomplete_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockItemsToTransferDataGrid extends StatefulWidget {
  const StockItemsToTransferDataGrid({super.key});

  @override
  State<StockItemsToTransferDataGrid> createState() => _StockItemsToTransferDataGridState();
}

class _StockItemsToTransferDataGridState extends State<StockItemsToTransferDataGrid> {
  List<StockTransferItem> _itemsToTransfer = <StockTransferItem>[];

  late DataGridController _dataGridController;
  late StockItemsToTransferDataSource _stockItemsToTransferDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockTransfer = context.read<StockTransferCubit>().state.stockTransfer;

    _itemsToTransfer = stockTransfer.items ?? [];
    _stockItemsToTransferDataSource = StockItemsToTransferDataSource(_itemsToTransfer, context);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'Items to Transfer'),
        DataGridToolbar(
          isImportCSV: true,
          search: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.3,
            child: AutocompleteDropdown(
              branchId: context.read<StockTransferCubit>().state.stockTransfer.destinationBranch?.id,
              onSelected: (value) {
                final stockTransferItem = value.toStockTransferItem();

                /// Add newly added items to the current stock transfer in state
                context.read<StockTransferCubit>().addItem(stockTransferItem);
              },
            ),
          ),
        ),
        BlocConsumer<StockTransferCubit, StockTransferState>(
          listenWhen: (previous, current) => previous.stockTransfer.items != current.stockTransfer.items,
          listener: (context, state) {
            _stockItemsToTransferDataSource._itemsToTransfer = state.stockTransfer.items ?? [];

            _stockItemsToTransferDataSource.buildDataGridRows();
            _stockItemsToTransferDataSource.updateDataGridSource();
          },
          builder: (_, state) => Container(
            decoration: UIStyleContainer.topBorder,
            child: state.stockTransfer.items?.isEmpty == true
                ? DataGridNoData(
                    columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TRANSFER_ITEMS),
                    source: _stockItemsToTransferDataSource)
                : ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.cellNavigationStyle,
                      child: SfDataGrid(
                        source: _stockItemsToTransferDataSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TRANSFER_ITEMS),
                        controller: _dataGridController,
                        selectionManager: customSelectionManager,
                        shrinkWrapRows: true,
                        allowEditing: true,
                        navigationMode: GridNavigationMode.cell,
                        selectionMode: SelectionMode.single,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        editingGestureType: EditingGestureType.tap,
                        tableSummaryRows: [
                          GridTableSummaryRow(
                            color: UIColors.background,
                            position: GridTableSummaryRowPosition.bottom,
                            showSummaryInRow: false,
                            title: 'Total',
                            columns: [
                              const GridSummaryColumn(
                                name: '',
                                columnName: 'cost',
                                summaryType: GridSummaryType.sum,
                              ),
                              const GridSummaryColumn(
                                name: '',
                                columnName: 'total',
                                summaryType: GridSummaryType.sum,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}

class StockItemsToTransferDataSource extends DataGridSource {
  StockItemsToTransferDataSource(List<StockTransferItem> itemsToTransfer, BuildContext context) {
    _itemsToTransfer = itemsToTransfer;
    _context = context;
    buildDataGridRows();
  }

  List<StockTransferItem> _itemsToTransfer = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() =>
      dataGridRows = _itemsToTransfer.map((item) => item.toDataGridRowItemsToTransfer()).toList();

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
          child: cellBuilder(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget cellBuilder(String key, DataGridCell cell, int id) => switch (key) {
        'qty_to_transfer' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: UIText.bodyRegular(cell.value.toString()),
          ),
        'cost' => UIText.bodyRegular((cell.value as double).toStringAsFixed(3)),
        'action' => LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) => UIButton.text(
              'Delete',
              iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
              onClick: () => context.read<StockTransferCubit>().removeItem(id),
            ),
          ),
        _ => UIText.bodyRegular(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : cell.value.toString(),
          ),
      };

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  bool onCellBeginEdit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    if (column.columnName == 'qty_to_transfer') {
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

    if (column.columnName == 'qty_to_transfer') {
      final newQtyToTransfer = int.tryParse(newCellValue);
      double cost = dataGridRows[dataRowIndex].getCells()[6].value;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_to_transfer', value: newQtyToTransfer);

      /// Compute new total per item and update the value in the DataGridRows
      double newTotalPerItem = (newQtyToTransfer ?? 0) * (cost);
      dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<double>(columnName: 'total', value: newTotalPerItem);

      _context.read<StockTransferCubit>().setQuantityToTransferPerItem(
            id: _itemsToTransfer[dataRowIndex].id!,
            qty: newQtyToTransfer!,
            total: newTotalPerItem,
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

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: summaryColumn?.columnName == 'cost'
          ? UIText.labelSemiBold(
              summaryRow.title!,
              align: TextAlign.end,
            )
          : UIText.label(summaryValue.toPesoString()),
    );
  }
}
