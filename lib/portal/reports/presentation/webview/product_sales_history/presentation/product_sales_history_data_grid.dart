import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/domain/entities/product_sale_history_item.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_bloc/product_sales_history_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_filter_cubit/product_sales_history_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductSalesHistoryDataGrid extends StatefulWidget {
  const ProductSalesHistoryDataGrid({super.key});

  @override
  State<ProductSalesHistoryDataGrid> createState() => _ProductSalesHistoryDataGridState();
}

class _ProductSalesHistoryDataGridState extends State<ProductSalesHistoryDataGrid> {
  late DataGridController _dataGridController;
  late ProductSalesHistoryDataGridSource _dataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSalesHistoryBloc, ProductSalesHistoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => DataGridNoData.custom(
            message: 'To see sales history, start by selecting a product, branch and date',
            columns: DataGridUtil.getColumns(DataGridColumn.productSaleHistory),
            source: ProductSalesHistoryDataGridSource(context, items: []),
          ),
          loaded: (data) {
            final paginatedData = data.transactions;
            _dataGridSource = ProductSalesHistoryDataGridSource(context, items: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _dataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.productSaleHistory),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _dataGridSource.rows.isEmpty
                            ? const DataGridEmpty(
                                title: 'No transactions found',
                                subtitle:
                                    'No sales or returns were found for the selected product in the specified branch and date.',
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<ProductSaleHistoryItem>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) {
                      final filterCubit = context.read<ProductSalesHistoryFilterCubit>();

                      filterCubit.setPageAndSize(page, size);

                      if (filterCubit.state.isValid) {
                        context.read<ProductSalesHistoryBloc>().add(
                              ProductSalesHistoryEvent.fetch(
                                filterCubit.state.variantId!,
                                filterCubit.state.toPageQuery,
                              ),
                            );
                      }
                    },
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.productSaleHistory),
            source: _dataGridSource = ProductSalesHistoryDataGridSource(context, items: []),
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

class ProductSalesHistoryDataGridSource extends DataGridSource {
  ProductSalesHistoryDataGridSource(BuildContext context, {required List<ProductSaleHistoryItem> items}) {
    _items = items;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<ProductSaleHistoryItem> _items = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRow()).toList();

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
            transactionId: row.getCells().first.value,
            transactionType: row.getCells().singleWhere((e) => e.columnName == 'type').value as TransactionType,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCell({
    required String colName,
    required DataGridCell cell,
    required int transactionId,
    required TransactionType transactionType,
  }) =>
      switch (colName) {
        'datetime' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onTapProductSaleHistoryItem(transactionId, transactionType),
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        'type' => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (cell.value as TransactionType).bgColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  (cell.value as TransactionType).label,
                  style: UIStyleText.hint.copyWith(
                    color: (cell.value as TransactionType).textColor,
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

  void _onTapProductSaleHistoryItem(int transactionId, TransactionType transactionType) {
    final action = transactionType == TransactionType.sale ? ProductHistoryAction.SALE : ProductHistoryAction.RETURN;
    _context.read<ProductHistoryDetailBloc>().add(ProductHistoryDetailEvent.getById(transactionId, action));
  }
}
