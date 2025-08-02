import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockTakePaginatedDataGrid extends StatefulWidget {
  const StockTakePaginatedDataGrid({super.key});

  @override
  State<StockTakePaginatedDataGrid> createState() => _StockTakePaginatedDataGridState();
}

class _StockTakePaginatedDataGridState extends State<StockTakePaginatedDataGrid> {
  late DataGridController _dataGridController;
  late StockTakeDataSource _stockReturnDataSource;

  List<StockTake> stockTakes = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<StockTakeListRemoteCubit>().getStockTakes();
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockTakeListRemoteCubit, StockTakeListRemoteState>(
      listenWhen: (previous, current) {
        if (previous is StockTakeListLoading && current is StockTakeListLoaded) {
          return ((current.data.currentPage! <= current.data.totalPages!) == true);
        }
        return false;
      },
      listener: (context, state) {
        if (state is StockTakeListLoaded) {
          stockTakes = state.data.stockTakes ?? [];
          _stockReturnDataSource = StockTakeDataSource(stockTakes);
        }
      },
      builder: (context, state) {
        if (state is StockTakeListError) {
          return Text(state.message);
        }
        if (state is StockTakeListLoaded) {
          return Column(
            children: [
              Expanded(
                child: Container(
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
                        gridLinesVisibility: GridLinesVisibility.horizontal,
                        headerRowHeight: 38,
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
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.stockTakes?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<StockTakeListFilterCubit, StockTakeListFilterState>(
                      listenWhen: (previous, current) => previous.size != current.size,
                      listener: (context, filter) {
                        setState(() => _rowsPerPage = filter.size!);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<StockTakeListFilterCubit>().setSize(value);

                          /// Go back to page 1 when:
                          ///  - total count is greater than the requested rows per page
                          ///  - requested rows per page will not have data anymore in the upcoming page to request
                          /// Example:
                          /// Previous list is 20 rows per page and have a total of 5 pages,
                          ///  when user now requests to have 100 rows per page, and the total page becomes less than 5,
                          ///  the next response will be an empty list.
                          /// To avoid, use the [totalPage], [totalCount] and the [rowsPerPage] selected to check
                          ///  if the page to pass in the request will be greater than the [totalPage] of our data.
                          /// If it is greater than the actual total page, then reset it to 1.
                          if (state.data.totalCount! <= value ||
                              state.data.totalPages! + 1 >
                                  ((state.data.totalCount! + (_rowsPerPage - 1)) / _rowsPerPage)) {
                            context.read<StockTakeListRemoteCubit>().getStockTakes(
                                  page: 1,
                                  size: _rowsPerPage,
                                  status: context.read<StockTakeListFilterCubit>().state.status,
                                  startDate: context.read<StockTakeListFilterCubit>().state.startDate,
                                  endDate: context.read<StockTakeListFilterCubit>().state.endDate,
                                );
                          } else {
                            context.read<StockTakeListRemoteCubit>().getStockTakes(
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  status: context.read<StockTakeListFilterCubit>().state.status,
                                  startDate: context.read<StockTakeListFilterCubit>().state.startDate,
                                  endDate: context.read<StockTakeListFilterCubit>().state.endDate,
                                );
                          }
                        },
                        menu: const [20, 50, 100],
                        menuAsString: (menu) => menu.toString(),
                      ),
                    ),
                    const UIHorizontalSpace(16),
                    UIText.labelMedium(
                      'Viewing ${(state.data.currentPage! - 1) * _rowsPerPage + 1} - ${state.data.currentPage! * _rowsPerPage > state.data.totalCount! ? state.data.totalCount! : state.data.currentPage! * _rowsPerPage} of ${state.data.totalCount} records',
                      color: UIColors.textLight,
                    ),
                    const Spacer(),
                    UIText.labelMedium(
                      'Page ${state.data.currentPage} of ${state.data.totalPages}',
                      color: UIColors.textLight,
                    ),
                    const UIHorizontalSpace(16),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != 1) {
                          context.read<StockTakeListRemoteCubit>().getStockTakes(
                                page: 1,
                                size: _rowsPerPage,
                                status: context.read<StockTakeListFilterCubit>().state.status,
                                startDate: context.read<StockTakeListFilterCubit>().state.startDate,
                                endDate: context.read<StockTakeListFilterCubit>().state.endDate,
                              );
                        }
                      },
                      icon: Assets.icons.firstPage.svg(
                        colorFilter:
                            (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != 1) {
                          context.read<StockTakeListRemoteCubit>().getStockTakes(
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                status: context.read<StockTakeListFilterCubit>().state.status,
                                startDate: context.read<StockTakeListFilterCubit>().state.startDate,
                                endDate: context.read<StockTakeListFilterCubit>().state.endDate,
                              );
                        }
                      },
                      icon: Assets.icons.arrowLeft.svg(
                        colorFilter:
                            (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != state.data.totalPages) {
                          context.read<StockTakeListRemoteCubit>().getStockTakes(
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                status: context.read<StockTakeListFilterCubit>().state.status,
                                startDate: context.read<StockTakeListFilterCubit>().state.startDate,
                                endDate: context.read<StockTakeListFilterCubit>().state.endDate,
                              );
                        }
                      },
                      icon: Assets.icons.arrowRight.svg(
                        colorFilter: (state.data.currentPage == state.data.totalPages
                                ? UIColors.textMuted
                                : UIColors.textRegular)
                            .toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != state.data.totalPages) {
                          context.read<StockTakeListRemoteCubit>().getStockTakes(
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                status: context.read<StockTakeListFilterCubit>().state.status,
                                startDate: context.read<StockTakeListFilterCubit>().state.startDate,
                                endDate: context.read<StockTakeListFilterCubit>().state.endDate,
                              );
                        }
                      },
                      icon: Assets.icons.lastPage.svg(
                        colorFilter: (state.data.currentPage == state.data.totalPages
                                ? UIColors.textMuted
                                : UIColors.textRegular)
                            .toColorFilter,
                      ),
                    ),
                  ],
                ),
            ],
          );
        }
        return DataGridLoading(
          columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TAKES),
          source: _stockReturnDataSource = StockTakeDataSource([]),
        );
      },
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

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _stockTakes.map((take) => take.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

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
        'start_time' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () {
                // _context.read<StockTakeBloc>().add(GetStockTakeByIdEvent(id));
                AppRouter.router.goNamed(
                  'stockTakeDetails',
                  pathParameters: {'id': id.toString()},
                );
              },
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        'status' => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: StatusMapper.color(cell.value).withOpacity(0.6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (cell.value as StockOrderStatus).label,
                  style: UIStyleText.hint.copyWith(
                    color: StatusMapper.textColor(cell.value),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };
}
