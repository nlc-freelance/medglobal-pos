import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockItemsReturnedDataGrid extends StatefulWidget {
  const StockItemsReturnedDataGrid({super.key});

  @override
  State<StockItemsReturnedDataGrid> createState() => _StockItemsReturnedDataGridState();
}

class _StockItemsReturnedDataGridState extends State<StockItemsReturnedDataGrid> {
  List<StockReturnItem> _itemsReturned = <StockReturnItem>[];

  late DataGridController _dataGridController;
  late StockItemsReturnedDataSource _stockItemsReturnedDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockReturn = context.read<StockReturnCubit>().state.stockReturn;
    final tax = stockReturn.tax ?? 0;
    final discount = stockReturn.discount ?? 0;

    _itemsReturned = stockReturn.items ?? [];
    _stockItemsReturnedDataSource = StockItemsReturnedDataSource(_itemsReturned, context, tax, discount);
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
        const PageSectionTitle(title: 'Items Returned'),
        ClipRect(
          clipper: HorizontalBorderClipper(),
          child: SfDataGridTheme(
            data: DataGridUtil.cellNavigationStyle,
            child: SfDataGrid(
              source: _stockItemsReturnedDataSource,
              columns: DataGridUtil.getColumns(DataGridColumn.SR_ITEMS_RETURNED),
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

class StockItemsReturnedDataSource extends DataGridSource {
  StockItemsReturnedDataSource(List<StockReturnItem> itemsReturned, BuildContext context, double tax, double discount) {
    _itemsReturned = itemsReturned;
    _context = context;
    _tax = tax;
    _discount = discount;
    buildDataGridRows();
  }

  List<StockReturnItem> _itemsReturned = [];

  List<DataGridRow> dataGridRows = [];

  late double _tax;
  late double _discount;

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsReturned.map((item) => item.toDataGridRowItemsReturned()).toList();

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
          child: cell.columnName == 'supplier_price'
              ? UIText.bodyRegular((cell.value as double).toStringAsFixed(3))
              : UIText.bodyRegular(
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
    return summaryValue.toPesoString();
  }
}
