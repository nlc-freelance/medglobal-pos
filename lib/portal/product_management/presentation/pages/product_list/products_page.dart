import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/product_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductsPage extends StatefulWidget {
  static String route = SideMenuTreeItem.PRODUCTS.route;

  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductListCubit _productListCubit;

  @override
  void initState() {
    super.initState();
    print('init');
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
                onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.NEW_PRODUCT.name),
              ),
            ],
          ),
          DataGridToolbar(
            isDownloadable: true,
            search: UISearchField(
              fieldWidth: 500.0,
              hint: 'Search product name / SKU / category',
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Assets.icons.search.svg(),
              ),
            ),
          ),
          BlocBuilder<ProductListCubit, ProductListState>(
            builder: (context, state) {
              if (state is ProductListError) {
                return Text(state.message);
              }
              if (state is ProductListLoaded) {
                return Expanded(child: ProductDataGrid(state.products));
              }
              return DataGridLoading(
                columns: columns,
                source: ProductDataSource([]),
                showCheckbox: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
