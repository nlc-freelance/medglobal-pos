import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order_item.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_cubit/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:uuid/uuid.dart';

class ProductCatalogDataGrid extends StatefulWidget {
  const ProductCatalogDataGrid(this.items, {super.key});

  final List<CatalogItem> items;

  @override
  State<ProductCatalogDataGrid> createState() => _ProductCatalogDataGridState();
}

class _ProductCatalogDataGridState extends State<ProductCatalogDataGrid> {
  late DataGridController _dataGridController;
  late ProductCatalogDataSource _productCatalogDataSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _productCatalogDataSource = ProductCatalogDataSource(widget.items, context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCatalogCubit, ProductCatalogState>(
      listener: (context, state) {
        if (state is ProductCatalogLoaded) {
          _productCatalogDataSource._items = state.products;

          _productCatalogDataSource.buildDataGridRows();
          _productCatalogDataSource.updateDataGridSource();
        }
      },
      builder: (context, state) {
        return Container(
          decoration: UIStyleContainer.topBorder,
          child: ClipRect(
            clipper: HorizontalBorderClipper(),
            child: SfDataGridTheme(
              data: DataGridUtil.rowNavigationStyle,
              child: SfDataGrid(
                source: _productCatalogDataSource,
                columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
                controller: _dataGridController,
                loadMoreViewBuilder: state is ProductCatalogLoaded && !state.hasReachedMax
                    ? (BuildContext context, LoadMoreRows load) {
                        load();

                        return Container(
                          height: 60,
                          color: UIColors.background,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.bottomCenter,
                          child: const SizedBox(
                            width: 12,
                            height: 12,
                            child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                          ),
                        );
                      }
                    : null,
                rowHeight: 70,
                navigationMode: GridNavigationMode.row,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.none,
                footerHeight: 100,
                footer: _productCatalogDataSource.rows.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Assets.icons.cube.svg(),
                            const UIVerticalSpace(12),
                            context.read<PosProductSearchCubit>().state.search != null
                                ? UIText.labelMedium(
                                    'No results found for \'${context.read<PosProductSearchCubit>().state.search}\'')
                                : UIText.labelMedium('No data available'),
                          ],
                        ),
                      )
                    : null,
                onCellTap: (details) {
                  /// Skip if user taps on the header cells
                  if (details.rowColumnIndex.rowIndex != 0) {
                    final id =
                        _productCatalogDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
                    final item = _productCatalogDataSource._items.firstWhere((item) => item.id == id);

                    context.read<OrderBloc>().add(
                          OrderEvent.addItem(OrderItem(
                            id: const Uuid().v4().hashCode,
                            itemId: item.id!,
                            name: item.displayName!,
                            price: item.price!,
                            sku: '',
                          )),
                        );
                    // addItem(TransactionItem(
                    //   id: const Uuid().v4().hashCode,
                    //   itemId: item.id,
                    //   name: item.displayName,
                    //   price: item.price,
                    // ));
                  }
                },
              ),
            ),
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

class ProductCatalogDataSource extends DataGridSource {
  ProductCatalogDataSource(List<CatalogItem> items, BuildContext context) {
    _items = items;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;

  List<CatalogItem> _items = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _items.map((item) => item.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Future<void> handleLoadMoreRows() async {
    final search = _context.read<PosProductSearchCubit>().state.search;
    _context.read<ProductCatalogCubit>().getProductCatalog(search: search);
  }

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
        'product_name' => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Product thumbnail
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: UIColors.whiteBg,
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                child: Text(
                  cell.value,
                  style: UIStyleText.bodyRegular.copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        _ => Text(
            cell.runtimeType.toString().contains('double')
                ? (cell.value as double).toPesoString()
                : cell.value.toString(),
            style: UIStyleText.bodyRegular.copyWith(fontSize: 15),
          ),
      };
}
