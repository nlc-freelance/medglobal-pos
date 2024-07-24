import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RegisterItemsDataGrid extends StatefulWidget {
  const RegisterItemsDataGrid(this.items, {super.key});

  final List<RegisterItem> items;

  @override
  State<RegisterItemsDataGrid> createState() => _RegisterItemsDataGridState();
}

class _RegisterItemsDataGridState extends State<RegisterItemsDataGrid> {
  late DataGridController _dataGridController;
  late RegisterItemsDataSource _registerItemsDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _registerItemsDataSource = RegisterItemsDataSource(mock);
    // _registerItemsDataSource = RegisterItemsDataSource(widget.items);
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
            source: _registerItemsDataSource,
            columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
            controller: _dataGridController,
            // shrinkWrapRows: true,
            navigationMode: GridNavigationMode.row,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
            footerHeight: 100,
            footer: _registerItemsDataSource.rows.isEmpty
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

class RegisterItemsDataSource extends DataGridSource {
  RegisterItemsDataSource(List<RegisterItem> items) {
    _items = items;
    buildDataGridRows();
  }

  List<RegisterItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRow()).toList();

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
        'product' => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Product thumbnail
              const CircleAvatar(),

              const UIHorizontalSpace(8),
              UIText.bodyRegular(cell.value),
            ],
          ),
        _ => UIText.bodyRegular((cell.value ?? '').toString()),
      };
}

final mock = [
  RegisterItem(id: 1, displayName: 'Product 1 500mg', stock: 20, price: 25.75),
  RegisterItem(id: 2, displayName: 'Product 2 200mg', stock: 20, price: 20.50),
  RegisterItem(id: 3, displayName: 'Product 3 300mg', stock: 20, price: 20.50),
  RegisterItem(id: 4, displayName: 'Product 4 400mg', stock: 20, price: 20.50),
  RegisterItem(id: 5, displayName: 'Product 5 1000mg', stock: 20, price: 30.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
  RegisterItem(id: 6, displayName: 'Product 6 100mg', stock: 50, price: 10.50),
];
