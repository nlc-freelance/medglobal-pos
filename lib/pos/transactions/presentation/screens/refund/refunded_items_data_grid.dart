import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
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

  late DataGridController _dataGridController;
  late RefundedItemsDataSource _refundedItemsDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    _items = widget.transaction.items ?? [];
    _refundedItemsDataSource = RefundedItemsDataSource(_items, widget.transaction);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterTransactionBloc, RegisterTransactionState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (transaction) {
            _items = transaction.items ?? [];
            _refundedItemsDataSource = RefundedItemsDataSource(_items, transaction);
          },
          orElse: () {},
        );
      },
      child: Column(
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
                  source: _refundedItemsDataSource,
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
                      title: 'Discount',
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
      ),
    );
  }
}

class RefundedItemsDataSource extends DataGridSource {
  RefundedItemsDataSource(
    List<TransactionItem> items,
    Transaction transaction,
  ) {
    _items = items;
    _transaction = transaction;
    buildDataGridRows();
  }

  List<TransactionItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  late Transaction _transaction;

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toRefundedTransactionItemsRow()).toList();

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
              getSummaryValue(summaryRow.title!, summaryValue),
              style: UIStyleText.labelSemiBold,
            ),
    );
  }

  String getSummaryValue(String label, String subtotal) {
    double? value;
    switch (label) {
      case 'Discount':
        value = _transaction.totalDiscountAmount;
      case 'Tax':
        value = _transaction.tax;
      case 'Total Refund':
        value = (subtotal.toDouble() ?? 0) - (_transaction.totalDiscountAmount ?? 0);
      default:
        return subtotal.toPesoString();
    }

    return value.toPesoString();
  }
}
