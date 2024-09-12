import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockItemsTransferredDataGrid extends StatefulWidget {
  const StockItemsTransferredDataGrid({super.key});

  @override
  State<StockItemsTransferredDataGrid> createState() => _StockItemsTransferredDataGridState();
}

class _StockItemsTransferredDataGridState extends State<StockItemsTransferredDataGrid> {
  List<StockTransferItem> _itemsTransferred = <StockTransferItem>[];

  late DataGridController _dataGridController;
  late StockItemsTransferredDataSource _stockItemsTransferredDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockTransfer = context.read<StockTransferCubit>().state.stockTransfer;

    _itemsTransferred = stockTransfer.items ?? [];
    _stockItemsTransferredDataSource = StockItemsTransferredDataSource(_itemsTransferred);
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
        const PageSectionTitle(title: 'Items Transferred'),
        ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _stockItemsTransferredDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.STOCK_ITEMS_TRANSFERRED),
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
                  title: 'Total',
                  columns: [
                    const GridSummaryColumn(
                      name: '',
                      columnName: 'cost',
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

class StockItemsTransferredDataSource extends DataGridSource {
  StockItemsTransferredDataSource(List<StockTransferItem> itemsReceived) {
    _itemsTransferred = itemsReceived;
    buildDataGridRows();
  }

  List<StockTransferItem> _itemsTransferred = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() =>
      dataGridRows = _itemsTransferred.map((item) => item.toDataGridRowItemsTransferred()).toList();

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
          child: cell.columnName == 'cost'
              ? UIText.bodyRegular((cell.value as double).toStringAsFixed(3))
              : UIText.bodyRegular(
                  cell.runtimeType.toString().contains('double')
                      ? (cell.value as double).toPesoString()
                      : (cell.value ?? '-').toString(),
                ),
        );
      }).toList(),
    );
  }

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: summaryColumn?.columnName == 'cost'
          ? UIText.labelSemiBold(
              summaryRow.title!,
              align: TextAlign.end,
            )
          : UIText.labelSemiBold(summaryValue.toPesoString()),
    );
  }
}
