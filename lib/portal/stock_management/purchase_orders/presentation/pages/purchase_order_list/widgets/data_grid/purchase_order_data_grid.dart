import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/widgets/data_grid/purchase_order_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PurchaseOrderDataGrid extends StatefulWidget {
  const PurchaseOrderDataGrid({super.key});

  @override
  State<PurchaseOrderDataGrid> createState() => _PurchaseOrderDataGridState();
}

class _PurchaseOrderDataGridState extends State<PurchaseOrderDataGrid> {
  late DataGridController _dataGridController;
  late PurchaseOrderDataGridSource _purchaseOrderDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<PurchaseOrder>, PaginatedListState<PurchaseOrder>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _purchaseOrderDataGridSource = PurchaseOrderDataGridSource(context, purchaseOrders: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _purchaseOrderDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.purchaseOrders, showId: true),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _purchaseOrderDataGridSource.rows.isEmpty ? const PurchaseOrderDataGridEmpty() : null,
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<PurchaseOrder>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) {
                      final filterCubit = context.read<PurchaseOrderListFilterCubit>();

                      filterCubit.setPageAndSize(page, size);

                      context.read<PaginatedListBloc<PurchaseOrder>>().add(
                            PaginatedListEvent<PurchaseOrder>.fetch(
                              query: filterCubit.state.toPageQuery,
                            ),
                          );
                    },
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.purchaseOrders, showId: true),
            source: _purchaseOrderDataGridSource = PurchaseOrderDataGridSource(context, purchaseOrders: []),
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

class PurchaseOrderDataGridSource extends DataGridSource {
  PurchaseOrderDataGridSource(BuildContext context, {required List<PurchaseOrder> purchaseOrders}) {
    _purchaseOrders = purchaseOrders;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<PurchaseOrder> _purchaseOrders = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _purchaseOrders.map((po) => po.toDataGridRow()).toList();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCell(
            colName: cell.columnName,
            cell: cell,
            purchaseOrderId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCell({
    required String colName,
    required DataGridCell cell,
    required int purchaseOrderId,
  }) =>
      switch (colName) {
        'id' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onTapPurchaseOrder(purchaseOrderId),
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
              color: StatusMapper.color(cell.value).withValues(alpha: 0.6),
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

  void _onTapPurchaseOrder(purchaseOrderId) {
    _context.goNamed(
      'purchaseOrderDetails',
      pathParameters: {'id': purchaseOrderId.toString()},
    );
  }
}
