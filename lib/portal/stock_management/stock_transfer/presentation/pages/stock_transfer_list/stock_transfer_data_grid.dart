import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockTransferDataGrid extends StatefulWidget {
  const StockTransferDataGrid(this.stockTransfers, {super.key});

  final List<StockTransfer> stockTransfers;

  @override
  State<StockTransferDataGrid> createState() => _StockTransferDataGridState();
}

class _StockTransferDataGridState extends State<StockTransferDataGrid> {
  late DataGridController _dataGridController;
  late StockTransferDataSource _stockTransferDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _stockTransferDataSource = StockTransferDataSource(widget.stockTransfers);
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
            source: _stockTransferDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TRANSFERS, showId: true),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            gridLinesVisibility: GridLinesVisibility.none,
            headerRowHeight: 46,
            footerHeight: 100,
            footer: _stockTransferDataSource.rows.isEmpty
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

class StockTransferDataSource extends DataGridSource {
  StockTransferDataSource(List<StockTransfer> stockTransfers) {
    _stockTransfers = stockTransfers;
    buildDataGridRows();
  }

  List<StockTransfer> _stockTransfers = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _stockTransfers.map((stock) => stock.toDataGridRow()).toList();

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
        'id' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => AppRouter.router.goNamed(
                'Stock Transfer Details',
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
