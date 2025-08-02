import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseItemsReceivedDataGrid extends StatefulWidget {
  const PurchaseItemsReceivedDataGrid({super.key});

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

    final purchaseOrder = context.read<PurchaseOrderFormCubit>().state.purchaseOrder;
    final tax = purchaseOrder.tax ?? 0;
    final discount = purchaseOrder.discount ?? 0;

    _itemsReceived = purchaseOrder.items ?? [];
    _purchaseItemsReceivedDataSource = PurchaseItemsReceivedDataSource(_itemsReceived, context, tax, discount);
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
        ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _purchaseItemsReceivedDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.PO_ITEMS_RECEIVED),
              controller: _dataGridController,
              selectionManager: customSelectionManager,
              shrinkWrapRows: true,
              navigationMode: GridNavigationMode.cell,
              selectionMode: SelectionMode.single,
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
      ],
    );
  }
}

class PurchaseItemsReceivedDataSource extends DataGridSource {
  PurchaseItemsReceivedDataSource(
      List<PurchaseOrderItem> itemsReceived, BuildContext context, double tax, double discount) {
    _itemsReceived = itemsReceived;
    _context = context;
    _tax = tax;
    _discount = discount;
    buildDataGridRows();
  }

  List<PurchaseOrderItem> _itemsReceived = [];

  List<DataGridRow> dataGridRows = [];

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
        'supplier_price' => UIText.bodyRegular((cell.value as double).toStringAsFixed(3)),
        _ => UIText.bodyRegular(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : (cell.value ?? '-').toString(),
          ),
      };

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
