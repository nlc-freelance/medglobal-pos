import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TransactionItemsDataGrid extends StatefulWidget {
  const TransactionItemsDataGrid(this.transaction, {super.key});

  final Transaction transaction;

  @override
  State<TransactionItemsDataGrid> createState() => _TransactionItemsDataGridState();
}

class _TransactionItemsDataGridState extends State<TransactionItemsDataGrid> {
  late List<TransactionItem> _items = <TransactionItem>[];

  late DataGridController _dataGridController;
  late TransactionItemsDataSource _transactionItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    _items = widget.transaction.items ?? [];

    _transactionItemsDataSource = TransactionItemsDataSource(_items, widget.transaction);
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
        const UIVerticalSpace(8),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.cellNavigationStyle,
              child: SfDataGrid(
                source: _transactionItemsDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.ORDERED_ITEMS),
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
                    title: 'Total Discount',
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
                    title: 'Total',
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
                    title: 'Cash',
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TransactionItemsDataSource extends DataGridSource {
  TransactionItemsDataSource(
    List<TransactionItem> itemsOrdered,
    Transaction transaction,
  ) {
    _items = itemsOrdered;
    _transaction = transaction;
    buildDataGridRows();
  }

  List<TransactionItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  late Transaction _transaction;

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toTransactionItemsRow()).toList();

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
    double? discount() => _items.singleWhere((sale) => sale.id == id).discount;
    DiscountType? discountType() => _items.singleWhere((sale) => sale.id == id).discountType;

    return switch (column) {
      'discount' => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIText.bodyRegular((cell.value as double).toPesoString()),
            if (discount() != null && discount() != 0 && discountType() == DiscountType.PERCENT) ...[
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
              )
            ],
          ],
        ),
      _ => UIText.bodyRegular(
          cell.runtimeType.toString().contains('double')
              ? (cell.value as double).toPesoString()
              : cell.value.toString(),
        ),
    };
  }

  @override
  Widget? buildTableSummaryCellWidget(
    GridTableSummaryRow summaryRow,
    GridSummaryColumn? summaryColumn,
    RowColumnIndex rowColumnIndex,
    String summaryValue,
  ) =>
      Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
        child: summaryColumn?.columnName == 'discount'
            ? Text(
                summaryRow.title!,
                textAlign: TextAlign.end,
                style: UIStyleText.labelSemiBold,
              )
            : summaryRow.title == 'Discount'
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UIText.labelSemiBold(getSummaryValue(summaryRow.title!, summaryValue)),
                      if (_transaction.discountType == DiscountType.PERCENT &&
                          _transaction.discount != null &&
                          _transaction.discount != 0) ...[
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
                                '${_transaction.discount.toString()}%',
                                style: UIStyleText.hint.copyWith(color: UIColors.buttonDanger, fontSize: 11),
                              ),
                            ],
                          ),
                        )
                      ],
                    ],
                  )
                : UIText.labelSemiBold(getSummaryValue(summaryRow.title!, summaryValue)),
      );

  String getSummaryValue(String label, String subtotal) {
    double? value;
    switch (label) {
      case 'Total Discount':
        value = _transaction.totalDiscountInPeso;
      case 'Tax':
        value = _transaction.tax;
      case 'Total':
        value = _transaction.total;
      case 'Cash':
        value = _transaction.amountPaid;
      default:
        return subtotal.toPesoString();
    }

    return value.toPesoString();
  }
}
