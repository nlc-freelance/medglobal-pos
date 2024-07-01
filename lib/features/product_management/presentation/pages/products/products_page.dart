import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/data_grid/product_grid.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/widgets/selected_products_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductsPage extends StatelessWidget {
  static String route = SideMenuTreeItem.manageProducts.route;

  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Manage Products',
          subtitle: Strings.subtitlePlaceholder,
          actions: [
            UIButton.filled(
              'New Product',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.addProduct.name),
            ),
          ],
        ),
        const DataGridToolbar(searchPlaceholder: 'Search product name / SKU / category'),
        DataGrid<ProductGrid>(
          columns: DataGridUtil.getGridColumns(DataGridColumn.products),
          data: productList,
          style: StyleDataGrid.rowNavigation,
          navigationMode: GridNavigationMode.row,
          showCheckbox: true,
          selectionMode: SelectionMode.multiple,
          selectionToolbarBuilder: (controller) => SelectedProductsToolbar(controller),
          onSelectedRowDataIds: (rows) =>
              context.read<ProductSelectionCubit>().addAllProductIds(rows.map((row) => row.id).toList()),
          selectedRowDataIDs: context.select((ProductSelectionCubit cubit) => cubit.state.selectedProductIds),
        ),
      ],
    );
  }
}
