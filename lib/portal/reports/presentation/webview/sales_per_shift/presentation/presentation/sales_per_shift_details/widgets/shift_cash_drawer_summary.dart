import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ShiftCashDrawerSummary extends StatefulWidget {
  const ShiftCashDrawerSummary(this.salesPerShift, {super.key});

  final SalesPerShiftDetails salesPerShift;

  @override
  State<ShiftCashDrawerSummary> createState() => _ShiftCashDrawerSummaryState();
}

class _ShiftCashDrawerSummaryState extends State<ShiftCashDrawerSummary> {
  late ShiftCashDrawerSummaryDataSource _shiftSalesSummaryDataSource;

  @override
  void initState() {
    super.initState();
    _shiftSalesSummaryDataSource = ShiftCashDrawerSummaryDataSource(
      widget.salesPerShift.cashDrawerSummary,
      widget.salesPerShift.closingCash ?? 0,
      widget.salesPerShift.actualCash ?? 0,
      widget.salesPerShift.excessCash ?? 0,
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
          columns: DataGridColumn.CASH_DRAWER_SUMMARY
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
              title: 'Closing Cash',
              columns: [
                const GridSummaryColumn(
                  name: '',
                  columnName: 'type',
                  summaryType: GridSummaryType.sum,
                ),
                const GridSummaryColumn(
                  name: '',
                  columnName: 'amount',
                  summaryType: GridSummaryType.sum,
                )
              ],
              position: GridTableSummaryRowPosition.bottom,
            ),
            GridTableSummaryRow(
              color: UIColors.background,
              showSummaryInRow: false,
              title: 'Actual Cash',
              columns: [
                const GridSummaryColumn(
                  name: '',
                  columnName: 'type',
                  summaryType: GridSummaryType.sum,
                ),
                const GridSummaryColumn(
                  name: '',
                  columnName: 'amount',
                  summaryType: GridSummaryType.sum,
                )
              ],
              position: GridTableSummaryRowPosition.bottom,
            ),
            GridTableSummaryRow(
              color: UIColors.background,
              showSummaryInRow: false,
              title: 'Excess/Short Cash',
              columns: [
                const GridSummaryColumn(
                  name: '',
                  columnName: 'type',
                  summaryType: GridSummaryType.sum,
                ),
                const GridSummaryColumn(
                  name: '',
                  columnName: 'amount',
                  summaryType: GridSummaryType.sum,
                )
              ],
              position: GridTableSummaryRowPosition.bottom,
            ),
          ],
        ),
      ),
    );
  }
}

class ShiftCashDrawerSummaryDataSource extends DataGridSource {
  ShiftCashDrawerSummaryDataSource(
    List<ShiftDetailSummary> cashDrawerSummary,
    double closingCash,
    double actualCash,
    double excessCash,
  ) {
    _cashDrawerSummary = cashDrawerSummary;
    _closingCash = closingCash;
    _actualCash = actualCash;
    _excessCash = excessCash;
    buildDataGridRows();
  }

  late double _closingCash;
  late double _actualCash;
  late double _excessCash;

  List<ShiftDetailSummary> _cashDrawerSummary = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _cashDrawerSummary
      .map((detail) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'type', value: detail.type),
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
    final isSummaryLabel = summaryColumn?.columnName == 'type';
    return Container(
      color: UIColors.background,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: isSummaryLabel ? 12 : 0),
      child: UIText.labelSemiBold(
        isSummaryLabel ? summaryRow.title! : _getSummaryValue(summaryRow),
        align: isSummaryLabel ? TextAlign.end : TextAlign.start,
      ),
    );
  }

  String _getSummaryValue(GridTableSummaryRow summary) {
    final title = summary.title;

    if (title == 'Closing Cash') return _closingCash.toPesoString();
    if (title == 'Actual Cash') return _actualCash.toPesoString();
    if (title == 'Excess/Short Cash') return _excessCash.toPesoString();
    return Strings.empty;
  }
}
