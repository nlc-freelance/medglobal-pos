import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class CompletedStockTakeDataGrid extends StatefulWidget {
  const CompletedStockTakeDataGrid({super.key});

  @override
  State<CompletedStockTakeDataGrid> createState() => _CompletedStockTakeDataGridState();
}

class _CompletedStockTakeDataGridState extends State<CompletedStockTakeDataGrid> {
  List<StockTakeItem> _completedStockTakeItems = <StockTakeItem>[];
  late DataGridController _dataGridController;
  late CompletedStockTakeDataSource _completedStockTakeDataSource;
  late CustomSelectionManager customSelectionManager;

  final mock = [
    const StockTakeItem(
      id: 1,
      name: 'Biogesic 500mg',
      sku: 'BG0001',
    ),
    const StockTakeItem(
      id: 2,
      name: 'Biogesic 1000mg',
      sku: 'BG0002',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _completedStockTakeDataSource = CompletedStockTakeDataSource(mock);
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
        const PageSectionTitle(title: 'Counted Items'),
        const DataGridToolbar(searchPlaceholder: 'Search variant name'),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.baseStyle,
              child: SfDataGrid(
                source: _completedStockTakeDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.ST_COMPLETED_COUNTED_ITEMS),
                controller: _dataGridController,
                selectionManager: customSelectionManager,
                shrinkWrapRows: true,
                navigationMode: GridNavigationMode.row,
                selectionMode: SelectionMode.single,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CompletedStockTakeDataSource extends DataGridSource {
  CompletedStockTakeDataSource(List<StockTakeItem> completedStockTakeItems) {
    _completedStockTakeItems = completedStockTakeItems;
    buildDataGridRows();
  }

  List<StockTakeItem> _completedStockTakeItems = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() =>
      dataGridRows = _completedStockTakeItems.map((item) => item.toDataGridRowCompleted()).toList();

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
}
