import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list/product_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/product_paginated_data_grid.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/selected_products_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductsPage extends StatefulWidget {
  static String route = SideMenuTreeItem.PRODUCTS.route;

  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late TextEditingController _searchController;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBulkActionCubit, ProductBulkActionState>(
      listener: (context, state) {
        if (state is ProductBulkActionError) SnackbarUtil.error(context, state.message);
        if (state is ProductBulkActionSuccess) {
          context.read<ProductListCubit>().getProducts();
          SnackbarUtil.success(context, state.message);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Manage Products',
            subtitle: 'View and manage products to keep track your inventory items.',
            actions: [
              UIButton.filled(
                'New Product',
                icon: Assets.icons.add.setSize(12.0),
                onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.NEW_PRODUCT.name),
              ),
            ],
          ),
          const UIVerticalSpace(20),
          DataGridToolbar(
            reportType: ReportType.products,
            search: UISearchField(
              fieldWidth: 500.0,
              hint: 'Search product name',
              controller: _searchController,
              onChanged: (value) => _debouncer.run(
                (() {
                  context.read<ProductListFilterCubit>().setSearchKey(value);
                  context.read<ProductListCubit>().getProducts(
                        search: value,
                        size: context.read<ProductListFilterCubit>().state.size ?? 20,
                      );
                }),
              ),
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Assets.icons.search.svg(),
              ),
            ),
          ),
          const SelectedProductsToolbar(),
          const Expanded(child: ProductPaginatedDataGrid()),
        ],
      ),
    );
  }
}
