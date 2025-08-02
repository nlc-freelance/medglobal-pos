import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_form/refund_form_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RefundableItemsDataGrid extends StatefulWidget {
  const RefundableItemsDataGrid(this.transaction, {super.key});

  final Transaction transaction;

  @override
  State<RefundableItemsDataGrid> createState() => _RefundableItemsDataGridState();
}

class _RefundableItemsDataGridState extends State<RefundableItemsDataGrid> {
  late DataGridController _dataGridController;
  late RefundableItemsDataSource _refundableItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  bool _isRefundAllSelected = false;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final items = widget.transaction.items.map((item) => item.toRefundItem).toList();

    _refundableItemsDataSource = RefundableItemsDataSource(items, context);

    context.read<RefundFormCubit>().loadItems(items);

    /// Set a new transaction in RefundCubit and copy the items of the original sale transaction register, id and items
    // context.read<RefundCubit>().setRefund(
    //       Transaction(
    //         register: widget.transaction.register,
    //         saleTransactionId: widget.transaction.id,
    //         items: _items,
    //       ),
    //     );
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please enter the quantity you would like to refund for each product.',
              style: UIStyleText.hint,
            ),
            const Spacer(),
            BlocListener<RefundFormCubit, RefundFormState>(
              listener: (context, state) {
                setState(() => _isRefundAllSelected = state.items.every((item) => item.isSelectedForRefund) == true);
              },
              child: Checkbox(
                value: _isRefundAllSelected,
                onChanged: (isSelected) {
                  setState(() => _isRefundAllSelected = isSelected == true);
                  for (var item in _refundableItemsDataSource._items) {
                    context.read<RefundFormCubit>().setRefundItemQty(
                          id: item.id,
                          qtyToRefund: _isRefundAllSelected ? item.quantity : 0,
                          // subtotal: _isRefundAllSelected ? item.subtotalPerItem : 0,
                        );
                  }
                },
                visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
              ),
            ),
            UIText.labelMedium('Refund all items'),
          ],
        ),
        const UIVerticalSpace(8),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.cellNavigationStyle,
              child: BlocConsumer<RefundFormCubit, RefundFormState>(
                listener: (context, state) {
                  _refundableItemsDataSource._items = state.items ?? [];

                  _refundableItemsDataSource.buildDataGridRows();
                  _refundableItemsDataSource.updateDataGridSource();
                },
                builder: (context, state) {
                  return SfDataGrid(
                    source: _refundableItemsDataSource,
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
                            columnName: 'discount',
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
                        title: 'Discount',
                        columns: [
                          const GridSummaryColumn(
                            name: '',
                            columnName: 'discount',
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
                            columnName: 'discount',
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
                            columnName: 'discount',
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

class RefundableItemsDataSource extends DataGridSource {
  RefundableItemsDataSource(
    List<RefundItem> items,
    BuildContext context,
  ) {
    _items = items;
    _context = context;
    buildDataGridRows();
  }

  List<RefundItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toRefundableTransactionItemsRow()).toList();

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

  Widget _buildCell(String column, DataGridCell cell, int id) {
    double? discount() => _items.singleWhere((sale) => sale.id == id).discountValue;
    double? discountInPesoPerUnit() => _items.singleWhere((sale) => sale.id == id).discountAmountPerUnit;
    DiscountType? discountType() => _items.singleWhere((sale) => sale.id == id).discountType;

    return switch (column) {
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
      'discount' => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (discount() != null && discount() != 0 && discountType() == DiscountType.percentage) ...[
              UIText.bodyRegular(discountInPesoPerUnit().toPesoString()),
              const UIHorizontalSpace(8),
              Container(
                margin: const EdgeInsets.only(top: 0),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: UIColors.cancelledBg.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.icons.tag.svg(colorFilter: UIColors.buttonDanger.toColorFilter, width: 12),
                    const UIHorizontalSpace(8),
                    Text(
                      '${discount()}%',
                      style: UIStyleText.hint.copyWith(color: UIColors.buttonDanger, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ] else
              UIText.bodyRegular(0.0.toPesoString()),
          ],
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

      _context.read<RefundFormCubit>().setRefundItemQty(
            id: refundItem.id,
            qtyToRefund: qtyToRefund,
            // subtotal: newSubtotal,
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
      child: summaryColumn?.columnName == 'discount'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.right,
              style: UIStyleText.labelSemiBold,
            )
          : Text(
              getSummaryValue(summaryRow.title!, summaryValue),
              style: UIStyleText.labelSemiBold,
            ),
    );
  }

  String getSummaryValue(String label, String subtotal) {
    /// Get discounts
    final refundItems = _context.read<RefundFormCubit>().state.items.where((item) => item.isSelectedForRefund).toList();
    final selectedItemsToRefundTotalDiscount =
        refundItems.fold(0.0, (discount, item) => discount + (item.discountAmountPerUnit * item.quantity));

    double? value;
    switch (label) {
      case 'Discount':
        value = selectedItemsToRefundTotalDiscount;
      case 'Tax':
        value = 0;
      case 'Total Refund':
        value = subtotal != '0' ? (int.tryParse(subtotal) ?? 0) - selectedItemsToRefundTotalDiscount : 0;
      default:
        return subtotal.toPesoString();
    }

    return value.toPesoString();
  }
}
