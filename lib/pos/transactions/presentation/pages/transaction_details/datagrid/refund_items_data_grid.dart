import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RefundItemsDataGrid extends StatefulWidget {
  const RefundItemsDataGrid(this.transaction, {super.key});

  final Transaction transaction;

  @override
  State<RefundItemsDataGrid> createState() => _RefundItemsDataGridState();
}

class _RefundItemsDataGridState extends State<RefundItemsDataGrid> {
  late List<TransactionItem> _items = <TransactionItem>[];
  late double _tax;

  late DataGridController _dataGridController;
  late RefundItemsDataSource _refundItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    _items = widget.transaction.items ?? [];
    _tax = widget.transaction.tax ?? 0;

    _refundItemsDataSource = RefundItemsDataSource(_items, context, _tax);

    /// Set a new transaction in RefundCubit and copy the items of the original sale transaction register, id and items
    context.read<RefundCubit>().setRefund(
          Transaction(
            register: widget.transaction.register,
            saleTransactionId: widget.transaction.id,
            items: _items,
          ),
        );
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
        UIText.heading6('Items Ordered'),
        Text(
          'Please input the quantity you wish to refund for a specific product.',
          style: UIStyleText.hint,
        ),
        const UIVerticalSpace(8),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.cellNavigationStyle,
              child: BlocConsumer<RefundCubit, RefundState>(
                listener: (context, state) {
                  _refundItemsDataSource._items = state.refund.items ?? [];

                  _refundItemsDataSource.buildDataGridRows();
                  _refundItemsDataSource.updateDataGridSource();
                },
                builder: (context, state) {
                  return SfDataGrid(
                    source: _refundItemsDataSource,
                    columns: DataGridUtil.getColumns(DataGridColumn.ORDERED_ITEMS_EDITABLE),
                    controller: _dataGridController,
                    selectionManager: customSelectionManager,
                    shrinkWrapRows: true,
                    selectionMode: SelectionMode.single,
                    allowEditing: true,
                    navigationMode: GridNavigationMode.cell,
                    editingGestureType: EditingGestureType.tap,
                    columnWidthMode: ColumnWidthMode.fill,
                    headerGridLinesVisibility: GridLinesVisibility.none,
                    tableSummaryRows: [
                      GridTableSummaryRow(
                        color: UIColors.background,
                        position: GridTableSummaryRowPosition.bottom,
                        showSummaryInRow: false,
                        title: 'Subtotal',
                        columns: [
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'price',
                            summaryType: GridSummaryType.sum,
                          ),
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'subtotal',
                            summaryType: GridSummaryType.sum,
                          ),
                        ],
                      ),
                      GridTableSummaryRow(
                        color: UIColors.background,
                        position: GridTableSummaryRowPosition.bottom,
                        showSummaryInRow: false,
                        title: 'Tax',
                        columns: [
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'price',
                            summaryType: GridSummaryType.sum,
                          ),
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'subtotal',
                            summaryType: GridSummaryType.sum,
                          ),
                        ],
                      ),
                      GridTableSummaryRow(
                        color: UIColors.background,
                        position: GridTableSummaryRowPosition.bottom,
                        showSummaryInRow: false,
                        title: 'Total Refund',
                        columns: [
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'price',
                            summaryType: GridSummaryType.sum,
                          ),
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'subtotal',
                            summaryType: GridSummaryType.sum,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RefundItemsDataSource extends DataGridSource {
  RefundItemsDataSource(
    List<TransactionItem> items,
    BuildContext context,
    double tax,
  ) {
    _items = items;
    _context = context;
    _tax = tax;
    buildDataGridRows();
  }

  List<TransactionItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  late double _tax;
  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toItemsOrderedRefundableRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCell(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id) => switch (column) {
        'is_selected' => IgnorePointer(child: Checkbox(value: (cell.value as bool), onChanged: (_) {})),
        'qty_to_refund' => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: UIText.bodyRegular(cell.value.toString()),
          ),
        'qty' => UIText.label('/ ${cell.value.toString()}'),
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
    if (column.columnName == 'qty_to_refund') {
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

    if (column.columnName == 'qty_to_refund') {
      final qtyToRefund = int.tryParse(newCellValue) ?? 0;
      double price = dataGridRows[dataRowIndex].getCells()[5].value;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_to_refund', value: qtyToRefund);

      // /// Compute new subtotal and update the value in the DataGridRows
      final newSubtotal = (price * qtyToRefund).roundToTwoDecimalPlaces();
      dataGridRows[dataRowIndex].getCells()[6] = DataGridCell<double>(columnName: 'subtotal', value: newSubtotal);

      final refundItem = _items[dataRowIndex];

      _context.read<RefundCubit>().setRefundItemQty(
            id: refundItem.id!,
            qtyToRefund: qtyToRefund,
            subtotal: newSubtotal,
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: summaryColumn?.columnName == 'price'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.right,
              style: UIStyleText.labelSemiBold,
            )
          : Text(
              summaryCellValue(_context, summaryRow.title!, summaryValue),
              style: UIStyleText.labelSemiBold,
            ),
    );
  }

  String summaryCellValue(BuildContext context, String summaryRowTitle, String summaryValue) {
    if (summaryRowTitle == 'Tax') {
      return _tax.toPesoString();
    }

    return summaryValue.toPesoString();
  }
}
