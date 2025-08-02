import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_filter/stock_return_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class StockReturnPaginatedDataGrid extends StatefulWidget {
  const StockReturnPaginatedDataGrid({super.key});

  @override
  State<StockReturnPaginatedDataGrid> createState() => _StockReturnPaginatedDataGridState();
}

class _StockReturnPaginatedDataGridState extends State<StockReturnPaginatedDataGrid> {
  late DataGridController _dataGridController;
  late StockReturnDataSource _stockReturnDataSource;

  List<StockReturn> stockReturns = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<StockReturnListRemoteCubit>().getStockReturns();
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockReturnListRemoteCubit, StockReturnListRemoteState>(listenWhen: (previous, current) {
      if (previous is StockReturnListLoading && current is StockReturnListLoaded) {
        return ((current.data.currentPage! <= current.data.totalPages!) == true);
      }
      return false;
    }, listener: (context, state) {
      if (state is StockReturnListLoaded) {
        stockReturns = state.data.stockReturns ?? [];
        _stockReturnDataSource = StockReturnDataSource(stockReturns);
      }
    }, builder: (context, state) {
      if (state is StockReturnListError) {
        return Text(state.message);
      }
      if (state is StockReturnListLoaded) {
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
                      columns: DataGridUtil.getColumns(DataGridColumn.STOCK_RETURNS, showId: true),
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
            if (state.data.stockReturns?.isNotEmpty == true)

              /// TODO: Extract pager to its own widget
              Row(
                children: [
                  BlocListener<StockReturnListFilterCubit, StockReturnListFilterState>(
                    listenWhen: (previous, current) => previous.size != current.size,
                    listener: (context, filter) {
                      setState(() => _rowsPerPage = filter.size!);
                    },
                    child: UIPopupMenuButton.textIcon(
                      title: '$_rowsPerPage rows',
                      iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                      onSelect: (value) {
                        setState(() => _rowsPerPage = value);
                        context.read<StockReturnListFilterCubit>().setSize(value);

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
                          context.read<StockReturnListRemoteCubit>().getStockReturns(
                                page: 1,
                                size: _rowsPerPage,
                                branchId: context.read<StockReturnListFilterCubit>().state.branchId,
                                status: context.read<StockReturnListFilterCubit>().state.status,
                                startDate: context.read<StockReturnListFilterCubit>().state.startDate,
                                endDate: context.read<StockReturnListFilterCubit>().state.endDate,
                              );
                        } else {
                          context.read<StockReturnListRemoteCubit>().getStockReturns(
                                page: state.data.currentPage!,
                                size: _rowsPerPage,
                                branchId: context.read<StockReturnListFilterCubit>().state.branchId,
                                status: context.read<StockReturnListFilterCubit>().state.status,
                                startDate: context.read<StockReturnListFilterCubit>().state.startDate,
                                endDate: context.read<StockReturnListFilterCubit>().state.endDate,
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
                        context.read<StockReturnListRemoteCubit>().getStockReturns(
                              page: 1,
                              size: _rowsPerPage,
                              branchId: context.read<StockReturnListFilterCubit>().state.branchId,
                              status: context.read<StockReturnListFilterCubit>().state.status,
                              startDate: context.read<StockReturnListFilterCubit>().state.startDate,
                              endDate: context.read<StockReturnListFilterCubit>().state.endDate,
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
                        context.read<StockReturnListRemoteCubit>().getStockReturns(
                              page: state.data.currentPage! - 1,
                              size: _rowsPerPage,
                              branchId: context.read<StockReturnListFilterCubit>().state.branchId,
                              status: context.read<StockReturnListFilterCubit>().state.status,
                              startDate: context.read<StockReturnListFilterCubit>().state.startDate,
                              endDate: context.read<StockReturnListFilterCubit>().state.endDate,
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
                        context.read<StockReturnListRemoteCubit>().getStockReturns(
                              page: state.data.currentPage! + 1,
                              size: _rowsPerPage,
                              branchId: context.read<StockReturnListFilterCubit>().state.branchId,
                              status: context.read<StockReturnListFilterCubit>().state.status,
                              startDate: context.read<StockReturnListFilterCubit>().state.startDate,
                              endDate: context.read<StockReturnListFilterCubit>().state.endDate,
                            );
                      }
                    },
                    icon: Assets.icons.arrowRight.svg(
                      colorFilter:
                          (state.data.currentPage == state.data.totalPages ? UIColors.textMuted : UIColors.textRegular)
                              .toColorFilter,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (state.data.currentPage != state.data.totalPages) {
                        context.read<StockReturnListRemoteCubit>().getStockReturns(
                              page: state.data.totalPages!,
                              size: _rowsPerPage,
                              branchId: context.read<StockReturnListFilterCubit>().state.branchId,
                              status: context.read<StockReturnListFilterCubit>().state.status,
                              startDate: context.read<StockReturnListFilterCubit>().state.startDate,
                              endDate: context.read<StockReturnListFilterCubit>().state.endDate,
                            );
                      }
                    },
                    icon: Assets.icons.lastPage.svg(
                      colorFilter:
                          (state.data.currentPage == state.data.totalPages ? UIColors.textMuted : UIColors.textRegular)
                              .toColorFilter,
                    ),
                  ),
                ],
              ),
          ],
        );
      }
      return DataGridLoading(
        columns: DataGridUtil.getColumns(DataGridColumn.STOCK_RETURNS, showId: true),
        source: _stockReturnDataSource = StockReturnDataSource([]),
      );
    });
  }
}

class StockReturnDataSource extends DataGridSource {
  StockReturnDataSource(List<StockReturn> stockReturns) {
    _stockReturns = stockReturns;
    buildDataGridRows();
  }

  List<StockReturn> _stockReturns = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _stockReturns.map((order) => order.toDataGridRow()).toList();

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
        'id' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () {
                // _context.read<StockReturnRemoteCubit>().getStockReturnById(id);
                AppRouter.router.goNamed(
                  'stockReturnDetails',
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
        _ => UIText.dataGridText(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : cell.value.toString(),
          ),
      };
}
