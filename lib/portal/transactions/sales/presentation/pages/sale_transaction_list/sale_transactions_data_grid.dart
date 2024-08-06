import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SaleTransactionDataGrid extends StatefulWidget {
  const SaleTransactionDataGrid(this.sales, {super.key});

  final List<Transaction> sales;

  @override
  State<SaleTransactionDataGrid> createState() => _SaleTransactionDataGridState();
}

class _SaleTransactionDataGridState extends State<SaleTransactionDataGrid> {
  late DataGridController _dataGridController;
  late SaleTransactionDataSource _saleTransactionDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _saleTransactionDataSource = SaleTransactionDataSource(widget.sales);
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
            source: _saleTransactionDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.SALE_TRANSACTIONS),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            footerHeight: 100,
            footer: _saleTransactionDataSource.rows.isEmpty
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
            onCellTap: (details) {
              if (details.rowColumnIndex.rowIndex != 0) {
                final id = _saleTransactionDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
                AppRouter.router.goNamed('Sale Details', pathParameters: {'id': id.toString()});
              }
            },
          ),
        ),
      ),
    );
  }
}

class SaleTransactionDataSource extends DataGridSource {
  SaleTransactionDataSource(List<Transaction> sales) {
    _sales = sales;
    buildDataGridRows();
  }

  List<Transaction> _sales = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _sales.map((sale) => sale.toDataGridRow()).toList();

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
    double? discount() => _sales.singleWhere((sale) => sale.id == id).discount;
    DiscountType? discountType() => _sales.singleWhere((sale) => sale.id == id).discountType;

    return switch (column) {
      'receipt_id' => HoverBuilder(
          builder: (isHover) => UIText.bodyRegular(
            cell.value.toString(),
            color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
            textDecoration: isHover ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      'discount_in_peso' => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIText.bodyRegular((cell.value as double).toPesoString()),
            if (discount() != null && discountType() == DiscountType.PERCENT) ...[
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
}
