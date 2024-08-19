import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RefundedItemsDataGrid extends StatefulWidget {
  const RefundedItemsDataGrid(this.transaction, {super.key});

  final Transaction transaction;

  @override
  State<RefundedItemsDataGrid> createState() => _RefundedItemsDataGridState();
}

class _RefundedItemsDataGridState extends State<RefundedItemsDataGrid> {
  late List<TransactionItem> _items = <TransactionItem>[];
  late double _tax;

  late DataGridController _dataGridController;
  late RefundedItemsDataSource _refundItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    _items = widget.transaction.items ?? [];
    _tax = widget.transaction.tax ?? 0;

    _refundItemsDataSource = RefundedItemsDataSource(_items, context, _tax);
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
        UIText.heading6('Items Refunded'),
        const UIVerticalSpace(8),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.cellNavigationStyle,
              child: SfDataGrid(
                source: _refundItemsDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.REFUNDED_ITEMS),
                controller: _dataGridController,
                selectionManager: customSelectionManager,
                shrinkWrapRows: true,
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RefundedItemsDataSource extends DataGridSource {
  RefundedItemsDataSource(
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

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toItemsRefundedRow()).toList();

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
          child: UIText.bodyRegular(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : cell.value.toString(),
          ),
        );
      }).toList(),
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
              style: summaryRow.title == 'Total Refund' ? UIStyleText.label : UIStyleText.bodyRegular,
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
