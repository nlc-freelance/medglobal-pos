import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseItemsToReceiveDataGrid extends StatefulWidget {
  const PurchaseItemsToReceiveDataGrid({super.key});

  @override
  State<PurchaseItemsToReceiveDataGrid> createState() => _PurchaseItemsToReceiveDataGridState();
}

class _PurchaseItemsToReceiveDataGridState extends State<PurchaseItemsToReceiveDataGrid> {
  List<PurchaseOrderItem> _itemsToReceive = <PurchaseOrderItem>[];

  late DataGridController _dataGridController;
  late PurchaseItemsToReceiveDataSource _purchaseItemsToReceiveDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final purchaseOrder = context.read<PurchaseOrderCubit>().state.purchaseOrder;
    final tax = purchaseOrder.tax ?? 0;
    final discount = purchaseOrder.discount ?? 0;

    _itemsToReceive = purchaseOrder.items ?? [];
    _purchaseItemsToReceiveDataSource = PurchaseItemsToReceiveDataSource(_itemsToReceive, context, tax, discount);
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
        BlocBuilder<PurchaseOrderCubit, PurchaseOrderState>(
          builder: (context, state) {
            return ClipRect(
              clipper: HorizontalBorderClipper(),
              child: SfDataGridTheme(
                data: DataGridUtil.cellNavigationStyle,
                child: SfDataGrid(
                  source: _purchaseItemsToReceiveDataSource,
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
            );
          },
        ),
      ],
    );
  }
}

class PurchaseItemsToReceiveDataSource extends DataGridSource {
  PurchaseItemsToReceiveDataSource(
      List<PurchaseOrderItem> itemsToReceive, BuildContext context, double tax, double discount) {
    _itemsToReceive = itemsToReceive;
    _context = context;
    _tax = tax;
    _discount = discount;

    buildDataGridRows();
  }

  List<PurchaseOrderItem> _itemsToReceive = [];

  List<DataGridRow> dataGridRows = [];

  late double _tax;
  late double _discount;
  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsToReceive.map((item) => item.toDataGridRowItemsReceived()).toList();

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
        'supplier_price' => UIText.bodyRegular((cell.value as double).toStringAsFixed(3)),
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

      _context.read<PurchaseOrderCubit>().setQuantityReceivedPerItem(
            id: _itemsToReceive[dataRowIndex].id!,
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
      padding: const EdgeInsets.all(16),
      child: summaryColumn?.columnName == 'supplier_price'
          ? Text(
              summaryRow.title!,
              textAlign: TextAlign.end,
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
    if (summaryRowTitle == 'Discount') {
      return _discount.toPesoString();
    }
    if (summaryRowTitle == 'Subtotal') {
      return summaryValue.toPesoString();
    }
    return (((double.tryParse(summaryValue) ?? 0) + _tax) - _discount).toPesoString();
  }
}
