import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockReturnDataGrid extends StatefulWidget {
  const StockReturnDataGrid(this.stockReturns, {super.key});

  final List<StockReturn> stockReturns;

  @override
  State<StockReturnDataGrid> createState() => _StockReturnDataGridState();
}

class _StockReturnDataGridState extends State<StockReturnDataGrid> {
  late DataGridController _dataGridController;
  late StockReturnDataSource _stockReturnDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _stockReturnDataSource = StockReturnDataSource(widget.stockReturns);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UIStyleContainer.topBorder,
      child: ClipRect(
        clipper: HorizontalBorderClipper(),
        child: SfDataGridTheme(
          data: DataGridUtil.rowNavigationStyle,
          child: SfDataGrid(
            source: _stockReturnDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.STOCK_RETURNS, showId: true),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            footerHeight: 100,
            footer: _stockReturnDataSource.rows.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Assets.icons.cube.svg(),
                        const UIVerticalSpace(12),
                        UIText.labelMedium('No data available'),
                      ],
                    ),
                  )
                : null,
            onCellTap: (details) {},
          ),
        ),
      ),
    );
  }
}

class StockReturnDataSource extends DataGridSource {
  StockReturnDataSource(List<StockReturn> stockReturns) {
    _stockReturns = stockReturns;
    buildDataGridRows();
  }

  List<StockReturn> _stockReturns = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _stockReturns.map((order) => order.toDataGridRow()).toList();

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

  Widget _buildCell(String column, DataGridCell cell, int id) => switch (column) {
        'id' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => AppRouter.router.goNamed(
                'Stock Return Details',
                pathParameters: {'id': id.toString()},
              ),
              hoverColor: UIColors.transparent,
              child: UIText.bodyRegular(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: isHover ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        'status' => Chip(
            label: Text(
              (cell.value as StockOrderStatus).label,
              style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(cell.value)),
            ),
            backgroundColor: StatusMapper.color(cell.value),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: UIColors.transparent),
            ),
          ),
        _ => UIText.bodyRegular(cell.value.toString()),
      };
}
