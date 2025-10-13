import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_text_field.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_cubit.dart';
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
    _items = widget.transaction.items ?? [];
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
        _returnItemsDataSource._isEditable = state.transaction?.status == ReturnStatus.awaitingAction;

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
                  headerRowHeight: 38,
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
  /// Holds the new value of all editable widget in the [DataGridCell].
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// [DataGridCell] focus nodes
  /// Help track when user taps outside, so we can submit the cell.
  FocusNode focusNode = FocusNode();

  /// [DataGridCell] text editing controllers
  /// Help to control the editable text in the text field.
  TextEditingController editingController = TextEditingController();

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
              : UIText.dataGridText(
                  cell.runtimeType.toString().contains('double')
                      ? (cell.value as double).toPesoString()
                      : (cell.value ?? Strings.noValue).toString(),
                ),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id) {
    return switch (column) {
      'write_off_qty' || 'restock_qty' => Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: cell.value == null
              ? UIText.dataGridText('0', color: UIColors.textMuted)
              : UIText.dataGridText(cell.value.toString()),
        ),
      'comment' => Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: cell.value == null
              ? UIText.dataGridText('Add comment', color: UIColors.textMuted)
              : UIText.dataGridText(cell.value.toString()),
        ),
      _ => UIText.dataGridText(
          cell.runtimeType.toString().contains('double')
              ? (cell.value as double).toPesoString()
              : cell.value.toString(),
        ),
    };
  }

  @override
  bool onCellBeginEdit(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
  ) {
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
  Future<void> onCellSubmit(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
  ) async {
    final dynamic oldValue =
        dataGridRow.getCells().firstWhereOrNull((DataGridCell cell) => cell.columnName == column.columnName)?.value;

    final rowIndex = dataGridRows.indexOf(dataGridRow);
    if (rowIndex == -1) return; // Prevents index range -1 when tapping outside the cell text field

    final columnIndex = rowColumnIndex.columnIndex;
    final itemId = _items[rowIndex].id!;

    if (oldValue == newCellValue) return;

    if (column.columnName == 'write_off_qty') {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<int>(
        columnName: 'write_off_qty',
        value: newCellValue,
      );
      _context.read<ReturnCubit>().setReturnItemWriteOffQty(
            id: itemId,
            writeOffQty: newCellValue,
          );
    }

    if (column.columnName == 'restock_qty') {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<int>(
        columnName: 'restock_qty',
        value: newCellValue,
      );
      _context.read<ReturnCubit>().setReturnItemRestockQty(
            id: itemId,
            restockQty: newCellValue,
          );
    }

    if (column.columnName == 'comment') {
      dataGridRows[rowIndex].getCells()[columnIndex] = DataGridCell<String>(
        columnName: 'comment',
        value: newCellValue,
      );
      _context.read<ReturnCubit>().setReturnItemComment(
            id: itemId,
            comment: newCellValue,
          );
    }

    // final dynamic oldValue = dataGridRow
    //         .getCells()
    //         .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
    //         .value ??
    //     '';
    //
    // final int dataRowIndex = dataGridRows.indexOf(dataGridRow);
    //
    // if (newCellValue == null || oldValue == newCellValue) {
    //   return;
    // }

    // if (column.columnName == 'write_off_qty') {
    //   final writeOffQty = int.tryParse(newCellValue) ?? 0;
    //
    //   dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
    //       DataGridCell<int>(columnName: 'write_off_qty', value: writeOffQty);
    //
    //   _context.read<ReturnCubit>().setReturnItemWriteOffQty(
    //         id: _items[dataRowIndex].id!,
    //         writeOffQty: writeOffQty,
    //       );
    // }

    // if (column.columnName == 'restock_qty') {
    //   final restockQty = int.tryParse(newCellValue) ?? 0;
    //
    //   dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
    //       DataGridCell<int>(columnName: 'restock_qty', value: restockQty);
    //
    //   _context.read<ReturnCubit>().setReturnItemRestockQty(
    //         id: _items[dataRowIndex].id!,
    //         restockQty: restockQty,
    //       );
    // }

    // if (column.columnName == 'comment') {
    //   final comment = (newCellValue ?? '').toString();
    //
    //   dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
    //       DataGridCell<String>(columnName: 'comment', value: comment);
    //
    //   _context.read<ReturnCubit>().setReturnItemComment(
    //         id: _items[dataRowIndex].id!,
    //         comment: comment,
    //       );
    // }
  }

  @override
  Widget? buildEditWidget(
    DataGridRow dataGridRow,
    RowColumnIndex rowColumnIndex,
    GridColumn column,
    CellSubmit submitCell,
  ) {
    focusNode.addListener(() {
      if (!focusNode.hasFocus) submitCell();
    });

    final textDisplay = dataGridRow
        .getCells()
        .firstWhereOrNull((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
        ?.value;

    newCellValue = textDisplay;

    return DataGridTextField(
      controller: editingController,
      textDisplay: textDisplay,
      focusNode: focusNode,
      inputFormatters: [
        if (column.columnName != 'comment') FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (String value) {
        if (value.isNotEmpty) {
          if (column.columnName != 'write_off_qty' || column.columnName != 'restock_qty') {
            newCellValue = value.toInt();
          } else if (column.columnName != 'comment') {
            newCellValue = value.toString();
          }
        } else {
          newCellValue = null;
        }
      },
      submitCell: submitCell,
    );

    // // Text going to display on editable widget
    // final String displayText = dataGridRow
    //         .getCells()
    //         .firstWhere((DataGridCell dataGridCell) => dataGridCell.columnName == column.columnName)
    //         .value
    //         ?.toString() ??
    //     '';
    //
    // // The new cell value must be reset.
    // // To avoid committing the [DataGridCell] value that was previously edited
    // // into the current non-modified [DataGridCell].
    // newCellValue = null;
    //
    // return Container(
    //   alignment: Alignment.centerLeft,
    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //   child: TextField(
    //     controller: editingController..text = displayText,
    //     autofocus: true,
    //     cursorHeight: 15.0,
    //     style: UIStyleText.bodyRegular,
    //     inputFormatters: [
    //       if (column.columnName != 'comment') FilteringTextInputFormatter.digitsOnly,
    //     ],
    //     decoration: const InputDecoration(
    //       contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    //       focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //         borderSide: BorderSide(color: UIColors.textGray),
    //       ),
    //     ),
    //     onTapOutside: (event) => submitCell(),
    //     onChanged: (String value) => newCellValue = value.isNotEmpty ? value : null,
    //     onSubmitted: (String value) {
    //       /// Call [CellSubmit] callback to fire the canSubmitCell and
    //       /// onCellSubmit to commit the new value in single place.
    //       submitCell();
    //     },
    //   ),
    // );
  }
}
