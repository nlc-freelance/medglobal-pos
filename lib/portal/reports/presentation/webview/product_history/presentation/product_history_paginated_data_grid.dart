import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_item.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_remote/stock_return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/bloc/transaction_bloc.dart';
// import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductHistoryPaginatedDataGrid extends StatefulWidget {
  const ProductHistoryPaginatedDataGrid({super.key});

  @override
  State<ProductHistoryPaginatedDataGrid> createState() => _ProductHistoryPaginatedDataGridState();
}

class _ProductHistoryPaginatedDataGridState extends State<ProductHistoryPaginatedDataGrid> {
  late DataGridController _dataGridController;
  late ProductHistoryDataSource _productHistoryDataSource;

  List<ProductHistoryItem> productHistoryItems = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<ProductHistoryListCubit>().reset();
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductHistoryListCubit, ProductHistoryListState>(
      listenWhen: (previous, current) {
        if (previous is ProductHistoryListLoading && current is ProductHistoryListLoaded) {
          return ((current.data.currentPage! <= current.data.totalPages!) == true);
        }
        return false;
      },
      listener: (context, state) {
        if (state is ProductHistoryListLoaded) {
          productHistoryItems = state.data.productHistoryItems ?? [];
          _productHistoryDataSource = ProductHistoryDataSource(productHistoryItems, context);
        }
      },
      builder: (context, state) {
        if (state is ProductHistoryListError) {
          return Text(state.message);
        }
        if (state is ProductHistoryListLoaded) {
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
                        source: _productHistoryDataSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.PRODUCT_HISTORY),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.horizontal,
                        headerRowHeight: 38,
                        footerHeight: 100,
                        footer: _productHistoryDataSource.rows.isEmpty
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
                      ),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.productHistoryItems?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<ProductHistoryListFilterCubit, ProductHistoryListFilterState>(
                      listenWhen: (previous, current) => previous.size != current.size,
                      listener: (context, filter) {
                        setState(() => _rowsPerPage = filter.size!);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<ProductHistoryListFilterCubit>().setSize(value);

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
                            context.read<ProductHistoryListCubit>().getProductHistory(
                                  page: 1,
                                  size: _rowsPerPage,
                                  variantId: context.read<ProductHistoryListFilterCubit>().state.variantId!,
                                  branchId: context.read<ProductHistoryListFilterCubit>().state.branchId!,
                                  startDate: context.read<ProductHistoryListFilterCubit>().state.startDate!,
                                );
                          } else {
                            context.read<ProductHistoryListCubit>().getProductHistory(
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  variantId: context.read<ProductHistoryListFilterCubit>().state.variantId!,
                                  branchId: context.read<ProductHistoryListFilterCubit>().state.branchId!,
                                  startDate: context.read<ProductHistoryListFilterCubit>().state.startDate!,
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
                          context.read<ProductHistoryListCubit>().getProductHistory(
                                page: 1,
                                size: _rowsPerPage,
                                variantId: context.read<ProductHistoryListFilterCubit>().state.variantId!,
                                branchId: context.read<ProductHistoryListFilterCubit>().state.branchId!,
                                startDate: context.read<ProductHistoryListFilterCubit>().state.startDate!,
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
                          context.read<ProductHistoryListCubit>().getProductHistory(
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                variantId: context.read<ProductHistoryListFilterCubit>().state.variantId!,
                                branchId: context.read<ProductHistoryListFilterCubit>().state.branchId!,
                                startDate: context.read<ProductHistoryListFilterCubit>().state.startDate!,
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
                          context.read<ProductHistoryListCubit>().getProductHistory(
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                variantId: context.read<ProductHistoryListFilterCubit>().state.variantId!,
                                branchId: context.read<ProductHistoryListFilterCubit>().state.branchId!,
                                startDate: context.read<ProductHistoryListFilterCubit>().state.startDate!,
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
                          context.read<ProductHistoryListCubit>().getProductHistory(
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                variantId: context.read<ProductHistoryListFilterCubit>().state.variantId!,
                                branchId: context.read<ProductHistoryListFilterCubit>().state.branchId!,
                                startDate: context.read<ProductHistoryListFilterCubit>().state.startDate!,
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
        if (state is ProductHistoryListLoading) {
          return DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.PRODUCT_HISTORY),
            source: _productHistoryDataSource = ProductHistoryDataSource([], context),
          );
        }
        return DataGridNoData.custom(
          message: 'To see history, start by selecting a product, branch and start date',
          columns: DataGridUtil.getColumns(DataGridColumn.PRODUCT_HISTORY),
          source: _productHistoryDataSource = ProductHistoryDataSource([], context),
        );
      },
    );
  }
}

class ProductHistoryDataSource extends DataGridSource {
  ProductHistoryDataSource(List<ProductHistoryItem> productHistoryItems, BuildContext context) {
    _productHistoryItems = productHistoryItems;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<ProductHistoryItem> _productHistoryItems = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _productHistoryItems.map((item) => item.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        final action = row.getCells().singleWhere((e) => e.columnName == 'action').value as ProductHistoryAction;
        final id = row.getCells().first.value;

        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cell.columnName == 'datetime' && (action != ProductHistoryAction.INITIAL && id != null)
              ? HoverBuilder(
                  builder: (isHover) => InkWell(
                        onTap: () {
                          /// TODO: initState on the destination page is not being triggered for every goNamed call
                          /// that's why we are fetching the resource by id again here before navigating
                          switch (action) {
                            // TODO: Create a bloc for product history and inject repositories to get these by id
                            // so the original bloc does not need to be created/provided from higher context to be shared
                            case ProductHistoryAction.PURCHASE:
                              _context.read<PurchaseOrderBloc>().add(PurchaseOrderEvent.getPurchaseOrderById(id));
                              AppRouter.router.goNamed(
                                'Purchase Order Details',
                                pathParameters: {'id': row.getCells().first.value.toString()},
                              );
                            case ProductHistoryAction.RETURN:
                              _context.read<StockReturnRemoteCubit>().getStockReturnById(id);
                              AppRouter.router.goNamed(
                                'Stock Return Details',
                                pathParameters: {'id': row.getCells().first.value.toString()},
                              );
                            case ProductHistoryAction.TAKE:
                              _context.read<StockTakeBloc>().add(GetStockTakeByIdEvent(id));
                              AppRouter.router.goNamed(
                                'Stock Take Details',
                                pathParameters: {'id': row.getCells().first.value.toString()},
                              );
                            case ProductHistoryAction.TRANSFER:
                              _context.read<StockTransferRemoteCubit>().getStockTransferById(id);
                              AppRouter.router.goNamed(
                                'Stock Transfer Details',
                                pathParameters: {'id': row.getCells().first.value.toString()},
                              );
                            case ProductHistoryAction.SALE:
                              _context.read<TransactionBloc>().add(TransactionEvent.getTransactionById(id));
                              AppRouter.router.goNamed(
                                'Sale Details',
                                pathParameters: {'id': row.getCells().first.value.toString()},
                              );
                            case ProductHistoryAction.INITIAL:
                              return;
                          }
                        },
                        hoverColor: UIColors.transparent,
                        child: UIText.dataGridText(
                          cell.value.toString(),
                          color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                          textDecoration: TextDecoration.underline,
                        ),
                      ))
              : UIText.dataGridText(cell.columnName == 'action' ? action.label : cell.value.toString()),
        );
      }).toList(),
    );
  }
}
