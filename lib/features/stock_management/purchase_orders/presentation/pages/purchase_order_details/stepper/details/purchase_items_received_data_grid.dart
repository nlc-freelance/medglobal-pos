import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class PurchaseItemsReceivedDataGrid extends StatefulWidget {
  const PurchaseItemsReceivedDataGrid({super.key, required this.isReceiving});

  final bool isReceiving;

  @override
  State<PurchaseItemsReceivedDataGrid> createState() => _PurchaseItemsReceivedDataGridState();
}

class _PurchaseItemsReceivedDataGridState extends State<PurchaseItemsReceivedDataGrid> {
  List<PurchaseOrderItem> _itemsReceived = <PurchaseOrderItem>[];

  late DataGridController _dataGridController;
  late PurchaseItemsReceivedDataSource _purchaseItemsReceivedDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final purchaseOrder = context.read<PurchaseOrderCubit>().state.purchaseOrder;
    final tax = purchaseOrder.tax ?? 0;
    final discount = purchaseOrder.discount ?? 0;

    _itemsReceived = purchaseOrder.items ?? [];
    _purchaseItemsReceivedDataSource =
        PurchaseItemsReceivedDataSource(_itemsReceived, context, widget.isReceiving, tax, discount);
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
        const PageSectionTitle(title: 'Items Received'),
        BlocListener<PurchaseOrderCubit, PurchaseOrderState>(
          listenWhen: (previous, current) =>
              previous.purchaseOrder.items != current.purchaseOrder.items ||
              previous.purchaseOrder.totalAmount != current.purchaseOrder.totalAmount,
          listener: (context, state) {
            _purchaseItemsReceivedDataSource._itemsReceived = state.purchaseOrder.items ?? [];

            _purchaseItemsReceivedDataSource.buildDataGridRows();
            _purchaseItemsReceivedDataSource.updateDataGridSource();
          },
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.cellNavigationStyle,
              child: SfDataGrid(
                source: _purchaseItemsReceivedDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS_RECEIVED),
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
                    title: 'Subtotal',
                    columns: [
                      const GridSummaryColumn(
                        name: '',
                        columnName: 'supplier_price',
                        summaryType: GridSummaryType.sum,
                      ),
                      const GridSummaryColumn(
                        name: '',
                        columnName: 'total',
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
                        columnName: 'supplier_price',
                        summaryType: GridSummaryType.sum,
                      ),
                      const GridSummaryColumn(
                        name: '',
                        columnName: 'total',
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
                        columnName: 'supplier_price',
                        summaryType: GridSummaryType.sum,
                      ),
                      const GridSummaryColumn(
                        name: '',
                        columnName: 'total',
                        summaryType: GridSummaryType.sum,
                      ),
                    ],
                  ),
                  GridTableSummaryRow(
                    color: UIColors.background,
                    position: GridTableSummaryRowPosition.bottom,
                    showSummaryInRow: false,
                    title: 'Total',
                    columns: [
                      const GridSummaryColumn(
                        name: '',
                        columnName: 'supplier_price',
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
      ],
    );
  }
}

class PurchaseItemsReceivedDataSource extends DataGridSource {
  PurchaseItemsReceivedDataSource(
      List<PurchaseOrderItem> itemsReceived, BuildContext context, bool isReceiving, double tax, double discount) {
    _itemsReceived = itemsReceived;
    _context = context;
    _isReceiving = isReceiving;
    _tax = tax;
    _discount = discount;
    buildDataGridRows();
  }

  List<PurchaseOrderItem> _itemsReceived = [];

  List<DataGridRow> dataGridRows = [];

  late bool _isReceiving;
  late double _tax;
  late double _discount;

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsReceived.map((item) => item.toDataGridRowItemsReceived()).toList();

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
        'qty_received' => _isReceiving
            ? Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: UIColors.background,
                  border: Border.all(color: UIColors.borderRegular),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: UIText.bodyRegular(cell.value.toString()),
              )
            : UIText.bodyRegular(cell.value.toString()),
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
    if (column.columnName == 'qty_received' && _isReceiving) {
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

    if (column.columnName == 'qty_received') {
      final newReceivedQty = int.tryParse(newCellValue);

      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<int>(columnName: 'qty_received', value: newReceivedQty);
      _itemsReceived[dataRowIndex].copyWith(qtyReceived: newReceivedQty);

      _context.read<PurchaseOrderCubit>().setQuantityReceivedPerItem(
            _itemsReceived[dataRowIndex].id!,
            newReceivedQty!,
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

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: summaryColumn?.columnName == 'supplier_price'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.end,
              style: summaryRow.title == 'Total' ? UIStyleText.heading6 : UIStyleText.labelSemiBold,
            )
          : Text(
              summaryCellValue(_context, summaryRow.title!, summaryValue),
              style: summaryRow.title == 'Total' ? UIStyleText.heading6 : UIStyleText.bodyRegular,
            ),
    );
  }

  String summaryCellValue(BuildContext context, String summaryRowTitle, String summaryValue) {
    if (summaryRowTitle == 'Tax') {
      return _tax.toString();
    }
    if (summaryRowTitle == 'Discount') {
      return _discount.toString();
    }
    return summaryValue;
  }
}
