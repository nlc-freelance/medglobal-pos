import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_group_by/sales_category_groupby_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_category_period/sales_category_period_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/presentation/cubit/sales_per_category/sales_per_category_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesPerCategoryDataGrid extends StatefulWidget {
  const SalesPerCategoryDataGrid({super.key});

  @override
  State<SalesPerCategoryDataGrid> createState() => _SalesPerCategoryDataGridState();
}

class _SalesPerCategoryDataGridState extends State<SalesPerCategoryDataGrid> {
  late SalesPerCategoryDataSource _salesPerCategoryDataSource;

  @override
  void initState() {
    super.initState();
    final defaultStartDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 6)));
    final defaultEndDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    context.read<SalesPerCategoryCubit>().getSalesPerCategory(
          SalesPerCategoryPayload(
            startDate: defaultStartDate,
            endDate: defaultEndDate,
          ),
        );
    context.read<SalesCategoryPeriodCubit>().setStartDate(defaultStartDate);
    context.read<SalesCategoryPeriodCubit>().setEndDate(defaultEndDate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SalesCategoryGroupByCubit, SalesCategoryGroupByState, SalesCategoryGroupByState>(
      selector: (state) => state,
      builder: (context, groupBy) {
        return BlocConsumer<SalesPerCategoryCubit, SalesPerCategoryState>(
          listener: (context, state) {
            if (state is SalesPerCategoryLoaded) {
              _salesPerCategoryDataSource = SalesPerCategoryDataSource(state.data);
              if (groupBy.groupBy?.isNotEmpty == true) {
                _salesPerCategoryDataSource.addColumnGroup(ColumnGroup(name: 'group_by', sortGroupRows: false));
              }
            }
          },
          builder: (context, state) {
            if (state is SalesPerCategoryError) {
              return Text(state.message);
            }
            if (state is SalesPerCategoryLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 24),
                      decoration: UIStyleContainer.topBorder,
                      child: ClipRect(
                        clipper: HorizontalBorderClipper(),
                        child: SfDataGridTheme(
                          data: DataGridUtil.rowNavigationStyle,
                          child: SfDataGrid(
                            allowExpandCollapseGroup: true,
                            groupCaptionTitleFormat: '{Key}',
                            source: _salesPerCategoryDataSource,
                            columns: _columns,
                            navigationMode: GridNavigationMode.row,
                            columnWidthMode: ColumnWidthMode.fill,
                            headerGridLinesVisibility: GridLinesVisibility.none,
                            gridLinesVisibility: GridLinesVisibility.horizontal,
                            headerRowHeight: 38,
                            footerHeight: 100,
                            footer: _salesPerCategoryDataSource.rows.isEmpty
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
                            tableSummaryRows: _summary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            return DataGridLoading(
              columns: _columns,
              source: _salesPerCategoryDataSource = SalesPerCategoryDataSource([]),
            );
          },
        );
      },
    );
  }

  List<GridColumn> get _columns => DataGridColumn.SALES_PER_CATEGORY
      .map<GridColumn>(
        (column) => GridColumn(
          visible: column.name != 'group_by',
          columnName: column.name,
          width: column.name == 'is_selected' ? 80 : double.nan,
          minimumWidth: column.minWidth ?? double.nan,
          label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              column.label,
              style: UIStyleText.inter.copyWith(
                color: UIColors.textMuted,
                fontSize: 10.85,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      )
      .toList();

  List<GridTableSummaryRow> get _summary => [
        GridTableSummaryRow(
          color: UIColors.whiteBg.withOpacity(0.4),
          position: GridTableSummaryRowPosition.bottom,
          showSummaryInRow: false,
          title: 'Total',
          columns: [
            const GridSummaryColumn(
              name: '',
              columnName: 'product_category',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: '',
              columnName: 'total_items_sold',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: '',
              columnName: 'total_items_returned',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: '',
              columnName: 'item_net_count',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: 'php',
              columnName: 'total_sales_amt',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: 'php',
              columnName: 'total_returned_amt',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: 'php',
              columnName: 'total_discount_amt',
              summaryType: GridSummaryType.sum,
            ),
            const GridSummaryColumn(
              name: 'php',
              columnName: 'item_net_sales',
              summaryType: GridSummaryType.sum,
            ),
          ],
        ),
      ];
}

class SalesPerCategoryDataSource extends DataGridSource {
  SalesPerCategoryDataSource(List<SalesPerCategory> data) {
    _data = data;
    buildDataGridRows();
  }

  List<SalesPerCategory> _data = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _data.map((value) => value.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
  Widget? buildGroupCaptionCellWidget(RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      color: UIColors.background,
      padding: const EdgeInsets.all(16),
      child: UIText.labelSemiBold(summaryValue),
    );
  }

  @override
  Widget? buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex, String summaryValue) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        summaryColumn?.columnName == 'product_category'
            ? summaryRow.title!
            : summaryColumn?.name == 'php'
                ? '₱${summaryValue.toPesoString()}'
                : summaryValue,
        textAlign: summaryColumn?.columnName == 'product_category' ? TextAlign.end : TextAlign.start,
        style: UIStyleText.labelSemiBold,
      ),
    );
  }
}
