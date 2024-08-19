import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockTakeDataGrid extends StatefulWidget {
  const StockTakeDataGrid(this.stockTakes, {super.key});

  final List<StockTake> stockTakes;

  @override
  State<StockTakeDataGrid> createState() => _StockTakeDataGridState();
}

class _StockTakeDataGridState extends State<StockTakeDataGrid> {
  late DataGridController _dataGridController;
  late StockTakeDataSource _stockReturnDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _stockReturnDataSource = StockTakeDataSource(widget.stockTakes);
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
            columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TAKES),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            gridLinesVisibility: GridLinesVisibility.none,
            headerRowHeight: 46,
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

class StockTakeDataSource extends DataGridSource {
  StockTakeDataSource(List<StockTake> stockTakes) {
    _stockTakes = stockTakes;
    buildDataGridRows();
  }

  List<StockTake> _stockTakes = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _stockTakes.map((take) => take.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return UIColors.transparent;
      }

      return UIColors.whiteBg.withOpacity(0.5);
    }

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCell(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id) => switch (column) {
        'start_time' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => AppRouter.router.goNamed(
                SideMenuTreeItem.STOCK_TAKE_DETAILS.name,
                pathParameters: {'id': id.toString()},
              ),
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        'status' => Chip(
            label: UIText.labelRegular(
              (cell.value as StockOrderStatus).label,
              color: StatusMapper.textColor(cell.value),
            ),
            backgroundColor: StatusMapper.color(cell.value),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: UIColors.transparent),
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };
}
