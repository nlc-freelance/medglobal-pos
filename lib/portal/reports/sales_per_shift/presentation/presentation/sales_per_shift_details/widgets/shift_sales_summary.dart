import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ShiftSalesSummary extends StatefulWidget {
  const ShiftSalesSummary(this.salesPerShift, {super.key});

  final SalesPerShiftDetails salesPerShift;

  @override
  State<ShiftSalesSummary> createState() => _ShiftSalesSummaryState();
}

class _ShiftSalesSummaryState extends State<ShiftSalesSummary> {
  late ShiftSalesSummaryDataSource _shiftSalesSummaryDataSource;

  @override
  void initState() {
    super.initState();
    _shiftSalesSummaryDataSource = ShiftSalesSummaryDataSource(
      widget.salesPerShift.salesSummary,
      widget.salesPerShift.netSales ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: HorizontalBorderClipper(),
      child: SfDataGridTheme(
        data: DataGridUtil.baseStyle,
        child: SfDataGrid(
          source: _shiftSalesSummaryDataSource,
          columns: DataGridColumn.SALES_SUMMARY
              .map((column) => GridColumn(
                    label: UIText.dataGridHeader(column.label),
                    columnName: column.name,
                  ))
              .toList(),
          columnWidthMode: ColumnWidthMode.fill,
          headerGridLinesVisibility: GridLinesVisibility.none,
          gridLinesVisibility: GridLinesVisibility.horizontal,
          shrinkWrapRows: true,
          highlightRowOnHover: false,
          headerRowHeight: 20,
          rowHeight: 36,
          tableSummaryRows: [
            GridTableSummaryRow(
              color: UIColors.background,
              showSummaryInRow: false,
              title: 'Total',
              columns: [
                const GridSummaryColumn(
                  name: '',
                  columnName: 'transactions',
                  summaryType: GridSummaryType.sum,
                ),
                const GridSummaryColumn(
                  name: '',
                  columnName: 'amount',
                  summaryType: GridSummaryType.sum,
                )
              ],
              position: GridTableSummaryRowPosition.bottom,
            )
          ],
        ),
      ),
    );
  }
}

class ShiftSalesSummaryDataSource extends DataGridSource {
  ShiftSalesSummaryDataSource(List<ShiftDetailSummary> salesSummary, double totalNetSales) {
    _salesSummary = salesSummary;
    _totalNetSales = totalNetSales;
    buildDataGridRows();
  }

  late double _totalNetSales;

  List<ShiftDetailSummary> _salesSummary = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _salesSummary
      .map((detail) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'type', value: detail.type),
              DataGridCell<int>(columnName: 'transactions', value: detail.count),
              DataGridCell<double>(columnName: 'amount', value: detail.amount),
            ],
          ))
      .toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          child: UIText.dataGridText(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : cell.value.toString(),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget? buildTableSummaryCellWidget(
    GridTableSummaryRow summaryRow,
    GridSummaryColumn? summaryColumn,
    RowColumnIndex rowColumnIndex,
    String summaryValue,
  ) {
    final isSummaryLabel = summaryColumn?.columnName == 'transactions';

    return Container(
      color: UIColors.background,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: isSummaryLabel ? 12 : 0),
      child: UIText.labelSemiBold(
        isSummaryLabel ? summaryRow.title! : _totalNetSales.toPesoString(),
        align: isSummaryLabel ? TextAlign.end : TextAlign.start,
      ),
    );
  }
}
