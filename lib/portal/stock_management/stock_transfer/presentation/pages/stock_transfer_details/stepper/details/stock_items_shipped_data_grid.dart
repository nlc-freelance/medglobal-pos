import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockItemsShippedDataGrid extends StatefulWidget {
  const StockItemsShippedDataGrid({super.key});

  @override
  State<StockItemsShippedDataGrid> createState() => _StockItemsShippedDataGridState();
}

class _StockItemsShippedDataGridState extends State<StockItemsShippedDataGrid> {
  List<StockTransferItem> _itemsShipped = <StockTransferItem>[];

  late DataGridController _dataGridController;
  late StockItemsShippedDataSource _stockItemsShippedDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockTransfer = context.read<StockTransferCubit>().state.stockTransfer;

    _itemsShipped = stockTransfer.items ?? [];
    _stockItemsShippedDataSource = StockItemsShippedDataSource(_itemsShipped, context);
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
        const PageSectionTitle(title: 'Items Shipped'),
        BlocBuilder<StockTransferCubit, StockTransferState>(
          builder: (context, state) {
            return ClipRect(
              clipper: HorizontalBorderClipper(),
              child: SfDataGridTheme(
                data: DataGridUtil.cellNavigationStyle,
                child: SfDataGrid(
                  source: _stockItemsShippedDataSource,
                  columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TRANSFER_ITEMS_SHIPPED),
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
            );
          },
        ),
      ],
    );
  }
}

class StockItemsShippedDataSource extends DataGridSource {
  StockItemsShippedDataSource(List<StockTransferItem> itemsShipped, BuildContext context) {
    _itemsShipped = itemsShipped;
    _context = context;

    /// Initially, auto populate received qty column with the transferred qty value
    dataGridRows = itemsShipped.map((item) => item.toDataGridRowItemsShipped(isInit: true)).toList();
  }

  List<StockTransferItem> _itemsShipped = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsShipped.map((item) => item.toDataGridRowItemsShipped()).toList();

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
        'qty_received' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: cell.value == null
                ? UIText.bodyRegular('0', color: UIColors.textMuted)
                : UIText.bodyRegular((cell.value as int).toString()),
          ),
        'cost' => UIText.bodyRegular((cell.value as double).toStringAsFixed(3)),
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
    if (column.columnName == 'qty_received') {
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

    if (column.columnName == 'qty_received') {
      final newQtyReceived = int.tryParse(newCellValue.toString());
      double cost = dataGridRows[dataRowIndex].getCells()[5].value;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_received', value: newQtyReceived);

      /// Compute new total per item and update the value in the DataGridRows
      double newTotalPerItem = (newQtyReceived ?? 0) * (cost);
      dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<double>(columnName: 'total', value: newTotalPerItem);

      _context.read<StockTransferCubit>().setQuantityReceivedPerItem(
            id: _itemsShipped[dataRowIndex].id!,
            qty: newQtyReceived,
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

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
      child: summaryColumn?.columnName == 'cost'
          ? UIText.labelSemiBold(
              summaryRow.title!,
              align: TextAlign.end,
            )
          : UIText.labelSemiBold(summaryValue.toPesoString()),
    );
  }
}
