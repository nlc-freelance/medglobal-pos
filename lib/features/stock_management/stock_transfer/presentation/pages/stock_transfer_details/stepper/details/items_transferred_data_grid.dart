import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class ItemsTransferredDataGrid extends StatefulWidget {
  const ItemsTransferredDataGrid({super.key});

  @override
  State<ItemsTransferredDataGrid> createState() => _ItemsTransferredDataGridState();
}

class _ItemsTransferredDataGridState extends State<ItemsTransferredDataGrid> {
  List<StockTransferItem> _itemsTransferred = <StockTransferItem>[];
  late DataGridController _dataGridController;
  late ItemsTransferredDataSource _itemsTransferredDataSoure;
  late CustomSelectionManager customSelectionManager;

  final mock = [
    const StockTransferItem(
      id: 1,
      name: 'Biogesic 500mg',
      sku: 'BG0001',
    ),
    const StockTransferItem(
      id: 2,
      name: 'Biogesic 1000mg',
      sku: 'BG0002',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _itemsTransferredDataSoure = ItemsTransferredDataSource(mock, context);
    customSelectionManager = CustomSelectionManager(_dataGridController);
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
              source: _itemsTransferredDataSoure,
              columns: DataGridUtil.getColumns(DataGridColumn.STOCK_ITEMS_TRANSFERRED),
              controller: _dataGridController,
              selectionManager: customSelectionManager,
              shrinkWrapRows: true,
              allowEditing: true,
              navigationMode: GridNavigationMode.cell,
              selectionMode: SelectionMode.single,
              columnWidthMode: ColumnWidthMode.fill,
              headerGridLinesVisibility: GridLinesVisibility.none,
              editingGestureType: EditingGestureType.tap,
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
                      columnName: 'subtotal',
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

class ItemsTransferredDataSource extends DataGridSource {
  ItemsTransferredDataSource(List<StockTransferItem> itemsReceived, BuildContext context) {
    _itemsTransferred = itemsReceived;
    _context = context;
    buildDataGridRows();
  }

  List<StockTransferItem> _itemsTransferred = [];

  List<DataGridRow> dataGridRows = [];

  late BuildContext _context;

  void buildDataGridRows() => dataGridRows = _itemsTransferred.map((item) => item.toDataGridRow()).toList();

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
          child: UIText.bodyRegular(cell.value.toString()),
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
          : UIText.labelSemiBold(summaryValue),
    );
  }
}
