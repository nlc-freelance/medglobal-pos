import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/selected_products_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductDataGrid extends StatefulWidget {
  const ProductDataGrid(this.products, {super.key});

  final List<Product> products;

  @override
  State<ProductDataGrid> createState() => _ProductDataGridState();
}

class _ProductDataGridState extends State<ProductDataGrid> {
  late DataGridController _dataGridController;
  late ProductDataSource _productDataSource;

  int _selectedRowsCount = 0;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    _productDataSource = ProductDataSource(widget.products);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (_selectedRowsCount > 0) SelectedProductsToolbar(_dataGridController),
          Container(
            decoration: UIStyleContainer.topBorder,
            child: ClipRect(
              clipper: HorizontalBorderClipper(),
              child: SfDataGridTheme(
                data: DataGridUtil.rowNavigationStyle,
                child: SfDataGrid(
                  controller: _dataGridController,
                  source: _productDataSource,
                  columns: DataGridUtil.getColumns(DataGridColumn.PRODUCTS),
                  footerHeight: 100,
                  footer: _productDataSource.rows.isEmpty
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
                  showCheckboxColumn: true,
                  shrinkWrapRows: true,
                  selectionMode: SelectionMode.multiple,
                  navigationMode: GridNavigationMode.row,
                  columnWidthMode: ColumnWidthMode.fill,
                  headerGridLinesVisibility: GridLinesVisibility.none,
                  onSelectionChanged: (_, __) {
                    setState(() => _selectedRowsCount = _dataGridController.selectedRows.length);
                    context
                        .read<ProductSelectionCubit>()
                        .addAllProductIds(_dataGridController.selectedRows.map((row) => row.id).toList());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDataSource extends DataGridSource {
  ProductDataSource(List<Product> products) {
    _products = products;
    buildDataGridRows();
  }
  List<Product> _products = [];

  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _products.map((product) => product.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cell.columnName == 'name'
              ? HoverBuilder(
                  builder: (isHover) => InkWell(
                        onTap: () => AppRouter.router.goNamed(
                          'Product Details',
                          pathParameters: {'id': row.getCells().first.value.toString()},
                        ),
                        hoverColor: UIColors.transparent,
                        child: UIText.bodyRegular(
                          cell.value.toString(),
                          color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                          textDecoration: isHover ? TextDecoration.underline : TextDecoration.none,
                        ),
                      ))
              : UIText.bodyRegular(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
