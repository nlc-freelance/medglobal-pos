import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_search_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductPaginatedDataGrid extends StatefulWidget {
  const ProductPaginatedDataGrid({super.key});

  @override
  ProductPaginatedDataGridState createState() => ProductPaginatedDataGridState();
}

class ProductPaginatedDataGridState extends State<ProductPaginatedDataGrid> {
  late DataGridController _dataGridController;
  late ProductDataGridSource _productDataGridSource;

  List<Product> _products = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<ProductListCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductListCubit, ProductListState>(
      listenWhen: (previous, current) {
        if (previous is ProductListLoading && current is ProductListLoaded) {
          return ((current.data.currentPage! <= current.data.totalPages!) == true);
        }
        if (current is ProductListNoResultFound) return true;
        return false;
      },
      listener: (context, state) {
        if (state is ProductListLoaded) {
          _products = state.data.products ?? [];
          _productDataGridSource = ProductDataGridSource(_products, _rowsPerPage);
        }
        if (state is ProductListNoResultFound) {
          _productDataGridSource = ProductDataGridSource([], _rowsPerPage);
        }
      },
      builder: (context, state) {
        if (state is ProductListError) {
          return Text(state.message);
        }
        if (state is ProductListNoResultFound) {
          return DataGridNoData.search(
            message: state.message,
            columns: DataGridUtil.getColumns(DataGridColumn.PRODUCTS),
            source: _productDataGridSource,
          );
        }
        if (state is ProductListLoaded) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: UIStyleContainer.horizontalBorder,
                  child: ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _productDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.PRODUCTS),
                        controller: _dataGridController,
                        rowsPerPage: _rowsPerPage,
                        shrinkWrapRows: true,
                        showCheckboxColumn: true,
                        navigationMode: GridNavigationMode.row,
                        selectionMode: SelectionMode.multiple,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 46,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 100,
                        footer: _productDataGridSource.rows.isEmpty
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
                        onSelectionChanged: (_, __) {
                          context
                              .read<ProductSelectionCubit>()
                              .addAllProductIds(_dataGridController.selectedRows.map((row) => row.id).toList());
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),

              /// TODO: Extract pager to its own widget
              Row(
                children: [
                  UIPopupMenuButton.textIcon(
                    title: '$_rowsPerPage rows',
                    iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                    onSelect: (value) {
                      setState(() => _rowsPerPage = value);
                      context.read<ProductListSearchCubit>().setSize(value);

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
                          state.data.totalPages! + 1 > ((state.data.totalCount! + (_rowsPerPage - 1)) / _rowsPerPage)) {
                        context.read<ProductListCubit>().getProducts(
                              page: 1,
                              size: _rowsPerPage,
                              search: context.read<ProductListSearchCubit>().state.search,
                            );
                      } else {
                        context.read<ProductListCubit>().getProducts(
                              page: state.data.currentPage!,
                              size: _rowsPerPage,
                              search: context.read<ProductListSearchCubit>().state.search,
                            );
                      }
                    },
                    menu: const [20, 50, 100],
                    menuAsString: (menu) => menu.toString(),
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
                        context.read<ProductListCubit>().getProducts(
                              page: 1,
                              size: _rowsPerPage,
                              search: context.read<ProductListSearchCubit>().state.search,
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
                        context.read<ProductListCubit>().getProducts(
                              page: state.data.currentPage! - 1,
                              size: _rowsPerPage,
                              search: context.read<ProductListSearchCubit>().state.search,
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
                        context.read<ProductListCubit>().getProducts(
                              page: state.data.currentPage! + 1,
                              size: _rowsPerPage,
                              search: context.read<ProductListSearchCubit>().state.search,
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
                        context.read<ProductListCubit>().getProducts(
                              page: state.data.totalPages!,
                              size: _rowsPerPage,
                              search: context.read<ProductListSearchCubit>().state.search,
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
          columns: DataGridUtil.getColumns(DataGridColumn.PRODUCTS),
          source: _productDataGridSource = ProductDataGridSource([], _rowsPerPage),
          showCheckbox: true,
        );
      },
    );
  }
}

class ProductDataGridSource extends DataGridSource {
  ProductDataGridSource(List<Product> products, int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    _products = products;
    _paginatedProducts = _products.getRange(0, products.length).toList(growable: false);
    buildDataGridRow(_products);
  }

  late int _rowsPerPage;

  List<Product> _products = [];

  List<Product> _paginatedProducts = [];

  List<DataGridRow> dataGridRows = [];

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;

    if (startIndex < _products.length && endIndex <= _products.length) {
      _paginatedProducts = _products.getRange(startIndex, endIndex).toList(growable: false);
      buildDataGridRow(_paginatedProducts);
      notifyListeners();
    } else {
      _paginatedProducts = [];
    }

    return true;
  }

  void update() => notifyListeners();

  void buildDataGridRow(List<Product> products) {
    dataGridRows = products.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
        DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
        DataGridCell<String>(columnName: 'category', value: dataGridRow.category?.name ?? '-'),
        DataGridCell<String>(columnName: 'created_at', value: DateFormat.yMd().format(dataGridRow.createdAt!)),
      ]);
    }).toList(growable: false);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return UIColors.transparent;
      }

      return UIColors.whiteBg.withOpacity(0.5);
    }

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cell.columnName == 'name'
              ? HoverBuilder(
                  builder: (isHover) => InkWell(
                        onTap: () => AppRouter.router
                            .goNamed('Product Details', pathParameters: {'id': row.getCells().first.value.toString()}),
                        hoverColor: UIColors.transparent,
                        child: UIText.dataGridText(
                          cell.value.toString(),
                          color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                          textDecoration: TextDecoration.underline,
                        ),
                      ))
              : UIText.dataGridText(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
