import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_filter_cubit/product_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/data_grid/product_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductDataGrid extends StatefulWidget {
  const ProductDataGrid({super.key});

  @override
  ProductDataGridState createState() => ProductDataGridState();
}

class ProductDataGridState extends State<ProductDataGrid> {
  late DataGridController _dataGridController;
  late ProductDataGridSource _productDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<Product>, PaginatedListState<Product>>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _productDataGridSource = ProductDataGridSource(context, products: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _productDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.products),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        showCheckboxColumn: true,
                        navigationMode: GridNavigationMode.row,
                        selectionMode: SelectionMode.multiple,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _productDataGridSource.rows.isEmpty ? const ProductDataGridEmpty() : null,
                        onSelectionChanged: (_, __) {
                          context
                              .read<ProductSelectionCubit>()
                              .addAllProductIds(_dataGridController.selectedRows.map((row) => row.id).toList());
                        },
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<Product>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) {
                      final filterCubit = context.read<ProductListFilterCubit>();

                      filterCubit.setPageAndSize(page, size);

                      Future.microtask(() {
                        final updatedQuery = filterCubit.state.toPageQuery;
                        context
                            .read<PaginatedListBloc<Product>>()
                            .add(PaginatedListEvent<Product>.fetch(query: updatedQuery));
                      });
                    },
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.products),
            source: _productDataGridSource = ProductDataGridSource(context, products: []),
          ),
        );
      },
    );
  }
}

class ProductDataGridSource extends DataGridSource {
  ProductDataGridSource(BuildContext context, {required List<Product> products}) {
    _products = products;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<Product> _products = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _products.map((product) => product.toDataGridRow()).toList();

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
            productId: row.getCells().first.value,
          ),
        );
      }).toList(),
    );
  }

  Widget cellBuilder({
    required String colName,
    required DataGridCell cell,
    required int productId,
  }) =>
      switch (colName) {
        'name' => HoverBuilder(
            builder: (isHover) => InkWell(
              onTap: () => _onTapProduct(productId),
              hoverColor: UIColors.transparent,
              child: UIText.dataGridText(
                cell.value.toString(),
                color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        _ => UIText.dataGridText(cell.value.toString()),
      };

  void _onTapProduct(productId) {
    /// Go to details page
    /// In the details page, fetch the product by the given id and load it in the ProductFormCubit
    _context.goNamed(
      'productDetails',
      pathParameters: {'id': productId.toString()},
    );
  }
}
