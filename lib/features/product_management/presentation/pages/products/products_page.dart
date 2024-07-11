import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/loading_data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/products/widgets/selected_products_toolbar.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductsPage extends StatefulWidget {
  static String route = SideMenuTreeItem.products.route;

  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductListCubit _productListCubit;

  @override
  void initState() {
    super.initState();
    _productListCubit = BlocProvider.of<ProductListCubit>(context)..getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.PRODUCTS);

    return BlocListener<ProductBulkActionCubit, ProductBulkActionState>(
      listener: (context, state) {
        if (state is ProductBulkActionError) ToastNotification.error(context, state.message);
        if (state is ProductBulkActionSuccess) {
          _productListCubit.getProducts();
          ToastNotification.success(context, state.message);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Manage Products',
            subtitle: Strings.subtitlePlaceholder,
            actions: [
              UIButton.filled(
                'New Product',
                icon: Assets.icons.add.setSize(12.0),
                onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.newProduct.name),
              ),
            ],
          ),
          const DataGridToolbar(searchPlaceholder: 'Search product name / SKU / category'),
          BlocBuilder<ProductListCubit, ProductListState>(
            builder: (context, state) {
              if (state is ProductListError) {
                return Center(child: Text(state.message));
              }
              if (state is ProductListLoaded) {
                return DataGrid<Product>(
                  columns: columns,
                  data: state.products,
                  style: DataGridUtil.rowNavigationStyle,
                  navigationMode: GridNavigationMode.row,
                  showCheckbox: true,
                  selectionMode: SelectionMode.multiple,
                  selectionToolbarBuilder: (controller) => SelectedProductsToolbar(controller),
                  onSelectedRowDataIds: (rows) =>
                      context.read<ProductSelectionCubit>().addAllProductIds(rows.map((row) => row.id).toList()),
                  selectedRowDataIDs: context.select((ProductSelectionCubit cubit) => cubit.state.selectedProductIds),
                );
              }
              return LoadingDataGrid<Supplier>(
                columns: columns,
                style: DataGridUtil.baseStyle,
              );
            },
          ),
        ],
      ),
    );
  }
}
