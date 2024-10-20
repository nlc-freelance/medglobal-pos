import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseOrderPaginatedDataGrid extends StatefulWidget {
  const PurchaseOrderPaginatedDataGrid({super.key});

  @override
  State<PurchaseOrderPaginatedDataGrid> createState() => _PurchaseOrderPaginatedDataGridState();
}

class _PurchaseOrderPaginatedDataGridState extends State<PurchaseOrderPaginatedDataGrid> {
  late DataGridController _dataGridController;
  late PurchaseOrderDataSource _purchaseOrderDataSource;

  List<PurchaseOrder> purchaseOrders = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders();
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PurchaseOrderListRemoteCubit, PurchaseOrderListRemoteState>(
      listenWhen: (previous, current) {
        if (previous is PurchaseOrderListLoading && current is PurchaseOrderListLoaded) {
          return ((current.data.currentPage! <= current.data.totalPages!) == true);
        }
        return false;
      },
      listener: (context, state) {
        if (state is PurchaseOrderListLoaded) {
          purchaseOrders = state.data.purchaseOrders ?? [];
          _purchaseOrderDataSource = PurchaseOrderDataSource(purchaseOrders, _rowsPerPage);
        }
      },
      builder: (context, state) {
        if (state is PurchaseOrderListError) {
          return Text(state.message);
        }
        if (state is PurchaseOrderListLoaded) {
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
                        source: _purchaseOrderDataSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.PURCHASE_ORDERS, showId: true),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.horizontal,
                        headerRowHeight: 38,
                        footerHeight: 100,
                        footer: _purchaseOrderDataSource.rows.isEmpty
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
              if (state.data.purchaseOrders?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<PurchaseOrderListFilterCubit, PurchaseOrderListFilterState>(
                      listenWhen: (previous, current) => previous.size != current.size,
                      listener: (context, filter) {
                        setState(() => _rowsPerPage = filter.size!);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<PurchaseOrderListFilterCubit>().setSize(value);

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
                            context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                                  page: 1,
                                  size: _rowsPerPage,
                                  branchId: context.read<PurchaseOrderListFilterCubit>().state.branchId,
                                  status: context.read<PurchaseOrderListFilterCubit>().state.status,
                                  startDate: context.read<PurchaseOrderListFilterCubit>().state.startDate,
                                  endDate: context.read<PurchaseOrderListFilterCubit>().state.endDate,
                                );
                          } else {
                            context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  branchId: context.read<PurchaseOrderListFilterCubit>().state.branchId,
                                  status: context.read<PurchaseOrderListFilterCubit>().state.status,
                                  startDate: context.read<PurchaseOrderListFilterCubit>().state.startDate,
                                  endDate: context.read<PurchaseOrderListFilterCubit>().state.endDate,
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
                          context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                                page: 1,
                                size: _rowsPerPage,
                                branchId: context.read<PurchaseOrderListFilterCubit>().state.branchId,
                                status: context.read<PurchaseOrderListFilterCubit>().state.status,
                                startDate: context.read<PurchaseOrderListFilterCubit>().state.startDate,
                                endDate: context.read<PurchaseOrderListFilterCubit>().state.endDate,
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
                          context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                branchId: context.read<PurchaseOrderListFilterCubit>().state.branchId,
                                status: context.read<PurchaseOrderListFilterCubit>().state.status,
                                startDate: context.read<PurchaseOrderListFilterCubit>().state.startDate,
                                endDate: context.read<PurchaseOrderListFilterCubit>().state.endDate,
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
                          context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                branchId: context.read<PurchaseOrderListFilterCubit>().state.branchId,
                                status: context.read<PurchaseOrderListFilterCubit>().state.status,
                                startDate: context.read<PurchaseOrderListFilterCubit>().state.startDate,
                                endDate: context.read<PurchaseOrderListFilterCubit>().state.endDate,
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
                          context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                branchId: context.read<PurchaseOrderListFilterCubit>().state.branchId,
                                status: context.read<PurchaseOrderListFilterCubit>().state.status,
                                startDate: context.read<PurchaseOrderListFilterCubit>().state.startDate,
                                endDate: context.read<PurchaseOrderListFilterCubit>().state.endDate,
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
          columns: DataGridUtil.getColumns(DataGridColumn.PURCHASE_ORDERS, showId: true),
          source: _purchaseOrderDataSource = PurchaseOrderDataSource([], _rowsPerPage),
        );
      },
    );
  }
}

class PurchaseOrderDataSource extends DataGridSource {
  PurchaseOrderDataSource(List<PurchaseOrder> purchaseOrders, int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    _purchaseOrders = purchaseOrders;
    _paginatedPurchaseOrders = _purchaseOrders.getRange(0, purchaseOrders.length).toList(growable: false);
    buildDataGridRows(_purchaseOrders);
  }

  late int _rowsPerPage;

  List<PurchaseOrder> _purchaseOrders = [];

  List<PurchaseOrder> _paginatedPurchaseOrders = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;

    if (startIndex < _purchaseOrders.length && endIndex <= _purchaseOrders.length) {
      _paginatedPurchaseOrders = _purchaseOrders.getRange(startIndex, endIndex).toList(growable: false);
      buildDataGridRows(_paginatedPurchaseOrders);
      notifyListeners();
    } else {
      _paginatedPurchaseOrders = [];
    }

    return true;
  }

  void buildDataGridRows(List<PurchaseOrder> purchaseOrders) =>
      dataGridRows = purchaseOrders.map((order) => order.toDataGridRow()).toList();

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
              onTap: () => AppRouter.router.goNamed(
                'Purchase Order Details',
                pathParameters: {'id': id.toString()},
              ),
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
