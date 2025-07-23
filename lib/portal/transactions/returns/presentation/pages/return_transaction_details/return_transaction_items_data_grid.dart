import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReturnTransactionItemsDataGrid extends StatefulWidget {
  const ReturnTransactionItemsDataGrid(this.transaction, {super.key});

  final Transaction transaction;

  @override
  State<ReturnTransactionItemsDataGrid> createState() => _ReturnTransactionItemsDataGridState();
}

class _ReturnTransactionItemsDataGridState extends State<ReturnTransactionItemsDataGrid> {
  List<TransactionItem> _items = <TransactionItem>[];

  late DataGridController _dataGridController;
  late ReturnItemsDataSource _returnItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  late bool _isAwaitingAction;

  @override
  void initState() {
    super.initState();
    _items = widget.transaction.items;
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    _isAwaitingAction = widget.transaction.status == ReturnStatus.awaitingAction;

    _returnItemsDataSource = ReturnItemsDataSource(_items, context, _isAwaitingAction);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnCubit, ReturnState>(
      listener: (context, state) {
        _returnItemsDataSource._items = state.items;
        _returnItemsDataSource._isEditable = _isAwaitingAction;

        _returnItemsDataSource.buildDataGridRows();
        _returnItemsDataSource.updateDataGridSource();
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageSectionTitle(title: 'Return Items'),
            ClipRect(
              clipper: HorizontalBorderClipper(),
              child: SfDataGridTheme(
                data: DataGridUtil.cellNavigationStyle,
                child: SfDataGrid(
                  source: _returnItemsDataSource,
                  columns: DataGridUtil.getColumns(DataGridColumn.RETURN_TRANSACTIONS_ITEMS),
                  controller: _dataGridController,
                  selectionManager: customSelectionManager,
                  shrinkWrapRows: true,
                  selectionMode: SelectionMode.single,
                  allowEditing: true,
                  navigationMode: GridNavigationMode.cell,
                  editingGestureType: EditingGestureType.tap,
                  columnWidthMode: ColumnWidthMode.fill,
                  headerGridLinesVisibility: GridLinesVisibility.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ReturnItemsDataSource extends DataGridSource {
  ReturnItemsDataSource(List<TransactionItem> items, BuildContext context, bool isEditable) {
    _items = items;
    _context = context;
    _isEditable = isEditable;
    buildDataGridRows();
  }

  late BuildContext _context;

  late bool _isEditable;

  List<TransactionItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toReturnTransactionItemsRow()).toList();

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
          child: _isEditable
              ? _buildCell(cell.columnName, cell, row.getCells().first.value)
              : UIText.bodyRegular(
                  cell.runtimeType.toString().contains('double')
                      ? (cell.value as double).toPesoString()
                      : cell.value.toString(),
                ),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id) {
    return switch (column) {
      'write_off_qty' || 'restock_qty' || 'comment' => Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: UIText.bodyRegular(cell.value.toString()),
        ),
      _ => UIText.bodyRegular(
          cell.runtimeType.toString().contains('double')
              ? (cell.value as double).toPesoString()
              : cell.value.toString(),
        ),
    };
  }

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();

  @override
  bool onCellBeginEdit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column) {
    if (_isEditable &&
        (column.columnName == 'write_off_qty' ||
            column.columnName == 'restock_qty' ||
            column.columnName == 'comment')) {
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

    if (column.columnName == 'write_off_qty') {
      final writeOffQty = int.tryParse(newCellValue) ?? 0;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'write_off_qty', value: writeOffQty);

      _context.read<ReturnCubit>().setReturnItemWriteOffQty(
            id: _items[dataRowIndex].id!,
            writeOffQty: writeOffQty,
          );
    }

    if (column.columnName == 'restock_qty') {
      final restockQty = int.tryParse(newCellValue) ?? 0;

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'restock_qty', value: restockQty);

      _context.read<ReturnCubit>().setReturnItemRestockQty(
            id: _items[dataRowIndex].id!,
            restockQty: restockQty,
          );
    }

    if (column.columnName == 'comment') {
      final comment = (newCellValue ?? '').toString();

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'comment', value: comment);

      _context.read<ReturnCubit>().setReturnItemComment(
            id: _items[dataRowIndex].id!,
            comment: comment,
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
        inputFormatters: [
          if (column.columnName != 'comment') FilteringTextInputFormatter.digitsOnly,
        ],
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
