import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
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

  int? _filteredRowsCount;
  final _searchController = TextEditingController();

  late DataGridController _dataGridController;
  late CompletedStockTakeDataSource _completedStockTakeDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    customSelectionManager = CustomSelectionManager(_dataGridController);

    final stockTake = context.read<StockTakeCubit>().state.stockTake;

    _completedStockTakeItems = stockTake.items ?? [];
    _completedStockTakeDataSource = CompletedStockTakeDataSource(_completedStockTakeItems);
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
        Row(
          children: [
            UIText.heading5('Counted Items'),
            const UIHorizontalSpace(8),
            Text(
              '(${_completedStockTakeDataSource.rows.length} total items)',
              style: UIStyleText.hint.copyWith(fontSize: 14, color: UIColors.textGray),
            ),
          ],
        ),
        const Divider(color: UIColors.borderMuted),
        const UIVerticalSpace(8),
        DataGridToolbar(
          padding: const EdgeInsets.only(bottom: 12),
          search: UISearchField(
            fieldWidth: 500.0,
            hint: 'Search variant name',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Assets.icons.search.svg(),
            ),
            controller: _searchController,
            onChanged: (value) {
              _completedStockTakeDataSource.clearFilters(columnName: 'variant_name');
              if (value.isNotEmpty) {
                _completedStockTakeDataSource.addFilter(
                  'variant_name',
                  FilterCondition(
                    value: value,
                    filterBehavior: FilterBehavior.stringDataType,
                    type: FilterType.contains,
                  ),
                );
              }
              _completedStockTakeDataSource.updateDataGridSource();
              setState(() => _filteredRowsCount = _completedStockTakeDataSource.effectiveRows.length);
            },
          ),
        ),
        if (_searchController.text.isNotEmpty)
          Text(
            '(${(_filteredRowsCount ?? 0).toString()}) Search results found for \'${_searchController.text}\'',
            style: UIStyleText.hint.copyWith(fontSize: 14, color: UIColors.textGray),
          ),
        const UIVerticalSpace(10),
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
                footer: _filteredRowsCount != null
                    ? _filteredRowsCount! == 0
                        ? Center(child: UIText.bodyRegular('No results found'))
                        : null
                    : null,
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
