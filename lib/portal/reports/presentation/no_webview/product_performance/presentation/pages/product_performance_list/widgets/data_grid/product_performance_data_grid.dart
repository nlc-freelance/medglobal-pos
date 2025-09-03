import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/report_bloc/report_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/bloc/product_performance_list_bloc/product_performance_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/pages/product_performance_list/widgets/data_grid/product_performance_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductPerformanceDataGrid extends StatefulWidget {
  const ProductPerformanceDataGrid({super.key});

  @override
  State<ProductPerformanceDataGrid> createState() => _ProductPerformanceDataGridState();
}

class _ProductPerformanceDataGridState extends State<ProductPerformanceDataGrid> {
  late DataGridController _dataGridController;
  late ProductPerformanceDataGridSource _productPerformanceDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductPerformanceListBloc, ProductPerformanceListState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (data, _) => _productPerformanceDataGridSource = ProductPerformanceDataGridSource(
            context,
            reports: data.items,
          ),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data, _) {
            final paginatedData = data;
            _productPerformanceDataGridSource = ProductPerformanceDataGridSource(context, reports: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _productPerformanceDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.productPerformanceReports),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _productPerformanceDataGridSource.rows.isEmpty
                            ? const ProductPerformanceDataGridEmpty()
                            : null,
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<Report>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) =>
                        context.read<ProductPerformanceListBloc>().add(ProductPerformanceListEvent.getReports(
                              query: PageQuery(
                                page: page,
                                size: size,
                                extra: ReportType.productPerformanceTypeQuery,
                              ),
                            )),
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.productPerformanceReports),
            source: _productPerformanceDataGridSource = ProductPerformanceDataGridSource(context, reports: []),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }
}

class ProductPerformanceDataGridSource extends DataGridSource with DialogMixin {
  ProductPerformanceDataGridSource(BuildContext context, {required List<Report> reports}) {
    _reports = reports;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<Report> _reports = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() =>
      dataGridRows = _reports.map((report) => report.toProductPerformanceDataGridRow()).toList();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cellBuilder(
            colName: cell.columnName,
            cell: cell,
            report: _reports.firstWhere((report) => report.id == row.getCells().first.value),
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required Report report,
  }) {
    return switch (colName) {
      'action' => switch (cell.value as ReportStatus) {
          ReportStatus.completed => UIButton.text(
              'Download',
              iconBuilder: (isHover) => Assets.icons.download.setColorOnHover(isHover),
              onClick: () => _onDownload(report),
            ),
          _ => UIText.dataGridText((cell.value as ReportStatus).label),
        },
      _ => UIText.dataGridText((cell.value ?? Strings.noValue).toString()),
    };
  }

  void _onDownload(Report report) {
    _context.read<ReportBloc>().add(ReportEvent.getReport(report.id));
  }
}
