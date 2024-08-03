import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Transaction {
  final int? id;
  final DateTime? date;
  final int? receiptNumber;
  final int? registerId;
  final Branch? branch;
  final double? subtotal;
  final double? discount;
  final double? tax;
  final double? total;

  Transaction({
    this.id,
    this.date,
    this.receiptNumber,
    this.registerId,
    this.branch,
    this.subtotal,
    this.discount,
    this.tax,
    this.total,
  });

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'receipt_id', value: (receiptNumber ?? Strings.empty).toString()),
          DataGridCell<String>(
            columnName: 'date',
            value: date != null ? DateFormat('mm/dd/yyyy HH:mm').format(date!) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'register_id', value: (registerId ?? Strings.empty).toString()),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? Strings.empty),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          DataGridCell<double>(columnName: 'discount', value: discount ?? 0),
          DataGridCell<double>(columnName: 'tax', value: tax ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
        ],
      );
}

class SaleTransactionDataGrid extends StatefulWidget {
  const SaleTransactionDataGrid(this.sales, {super.key});

  final List<Transaction> sales;

  @override
  State<SaleTransactionDataGrid> createState() => _SaleTransactionDataGridState();
}

class _SaleTransactionDataGridState extends State<SaleTransactionDataGrid> {
  late DataGridController _dataGridController;
  late TransactionDataSource _purchaseOrderDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _purchaseOrderDataSource = TransactionDataSource(widget.sales);
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
            source: _purchaseOrderDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.SALE_TRANSACTIONS),
            controller: _dataGridController,
            shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            footerHeight: 100,
            footer: _purchaseOrderDataSource.rows.isEmpty
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

class TransactionDataSource extends DataGridSource {
  TransactionDataSource(List<Transaction> sales) {
    _sales = sales;
    buildDataGridRows();
  }

  List<Transaction> _sales = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _sales.map((order) => order.toDataGridRow()).toList();

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
        'receipt_id' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () {},
              hoverColor: UIColors.transparent,
              child: UIText.bodyRegular(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: isHover ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        _ => UIText.bodyRegular(cell.value.toString()),
      };
}
