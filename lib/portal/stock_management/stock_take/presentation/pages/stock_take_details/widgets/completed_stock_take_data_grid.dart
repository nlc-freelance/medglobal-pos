import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompletedStockTakeDataGrid extends StatefulWidget {
  const CompletedStockTakeDataGrid({super.key});

  @override
  State<CompletedStockTakeDataGrid> createState() => _CompletedStockTakeDataGridState();
}

class _CompletedStockTakeDataGridState extends State<CompletedStockTakeDataGrid> {
  final _debouncer = Debouncer(milliseconds: 500);

  List<StockTakeItem> stockTakeItems = [];
  int _rowsPerPage = 20;
  int _countedTotal = 0;

  late TextEditingController _searchController;
  late DataGridController _dataGridController;
  late CompletedStockTakeDataSource _completedStockTakeDataSource;
  late CustomSelectionManager customSelectionManager;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _searchController = TextEditingController();

    customSelectionManager = CustomSelectionManager(_dataGridController);

    _completedStockTakeDataSource = CompletedStockTakeDataSource([]);
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountedItemsListCubit, CountedItemsListState>(
      listener: (context, state) {
        if (state is CountedItemsListLoaded) {
          _completedStockTakeDataSource = CompletedStockTakeDataSource(state.data.stockTakeItems ?? []);
          if (state.search == null) setState(() => _countedTotal = state.data.totalCount ?? 0);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UIText.heading5('Counted Items'),
                const UIHorizontalSpace(8),
                Text(
                  '($_countedTotal total items)',
                  style: UIStyleText.hint.copyWith(fontSize: 14, color: UIColors.textGray),
                ),
              ],
            ),
            const Divider(color: UIColors.borderMuted),
            const UIVerticalSpace(8),
            DataGridToolbar(
              padding: const EdgeInsets.only(bottom: 16),
              search: UISearchField(
                fieldWidth: 500.0,
                hint: 'Search variant name',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
                controller: _searchController,
                onChanged: (value) => _debouncer.run(
                  (() {
                    context.read<CountedItemsListCubit>().getItems(
                          id: context.read<StockTakeCubit>().state.stockTake.id!,
                          size: context.read<CountedItemsListFilterCubit>().state.size!,
                          search: value,
                        );
                    context.read<CountedItemsListFilterCubit>().setSearch(value);
                  }),
                ),
              ),
            ),
            if (state is CountedItemsListInitial)
              DataGridNoData.custom(
                columns: DataGridUtil.getColumns(DataGridColumn.ST_COUNTED_ITEMS),
                source: _completedStockTakeDataSource = CompletedStockTakeDataSource([]),
                message: 'Items will be loaded when the stock take has been completed.',
              )
            else if (state is CountedItemsListError)
              Text(state.message)
            else if (state is CountedItemsListLoaded) ...[
              Expanded(
                child: Container(
                  decoration: UIStyleContainer.topBorder,
                  child: ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
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
                        headerRowHeight: 38,
                        footerHeight: state.data.stockTakeItems?.isEmpty == true ? 100 : 0,
                        footer: state.data.stockTakeItems?.isEmpty == true
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Assets.icons.cube.svg(),
                                    const UIVerticalSpace(12),
                                    UIText.labelMedium(
                                      _searchController.text.isNotEmpty
                                          ? 'No results found for \'${_searchController.text}\''
                                          : 'No data available',
                                      color: UIColors.textMuted,
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.stockTakeItems?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<CountedItemsListFilterCubit, CountedItemsListFilterState>(
                      listenWhen: (previous, current) => previous.size != current.size,
                      listener: (context, filter) {
                        setState(() => _rowsPerPage = filter.size!);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<CountedItemsListFilterCubit>().setSize(value);

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
                            context.read<CountedItemsListCubit>().getItems(
                                  id: context.read<StockTakeCubit>().state.stockTake.id!,
                                  page: 1,
                                  size: _rowsPerPage,
                                  search: context.read<CountedItemsListFilterCubit>().state.search,
                                );
                          } else {
                            context.read<CountedItemsListCubit>().getItems(
                                  id: context.read<StockTakeCubit>().state.stockTake.id!,
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  search: context.read<CountedItemsListFilterCubit>().state.search,
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
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: 1,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
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
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
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
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
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
                          context.read<CountedItemsListCubit>().getItems(
                                id: context.read<StockTakeCubit>().state.stockTake.id!,
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                search: context.read<CountedItemsListFilterCubit>().state.search,
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
            ] else
              DataGridLoading(
                columns: DataGridUtil.getColumns(DataGridColumn.ST_COUNTED_ITEMS),
                source: _completedStockTakeDataSource = CompletedStockTakeDataSource([]),
              ),
          ],
        );
      },
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
