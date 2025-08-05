import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_cubit/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_closed.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_sync_bloc/product_catalog_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/screens/product_catalog_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

class SalesScreen extends StatelessWidget {
  static String route = '/pos/register';

  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
      listener: (context, state) {
        state.maybeWhen(
          // open: (_, __) => context.read<ProductCatalogSyncBloc>().add(const ProductCatalogSyncEvent.initialFetch()),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Catalog
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ProductCatalogSyncBloc, ProductCatalogSyncState>(
                      builder: (context, state) => state.maybeWhen(
                        syncing: () => Text('Syncing....'),
                        synced: (lastSyncedAt) => Text(lastSyncedAt.toFullDateWithTimeFormat()),
                        failure: (message) => Text(message),
                        orElse: () => const Text('hello'),
                      ),
                    ),
                    InkWell(
                      child: Text('Sync'),
                      onTap: () =>
                          context.read<ProductCatalogSyncBloc>().add(const ProductCatalogSyncEvent.initialFetch()),
                    ),
                    state.maybeWhen(
                      open: (shift, _) => Expanded(child: const ProductCatalog()),
                      orElse: () => DataGridNoData(
                        columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
                        source: ProductCatalogDataSource([], context),
                        isCustom: true,
                        message: 'The register is currently closed.',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const UIHorizontalSpace(16),
            // Cart
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: state.maybeWhen(
                  open: (_, __) => const CartOpen(),
                  closed: (_) => const CartClosed(),
                  orElse: () => const SizedBox(),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({super.key});

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductCatalogSyncBloc, ProductCatalogSyncState>(
      listener: (context, state) {
        state.maybeWhen(
          synced: (_) => context.read<ProductCatalogCubit>().getProductCatalog(),
          orElse: () {},
        );
      },
      child: Column(
        children: [
          UISearchField(
            fieldWidth: double.infinity,
            hint: 'Search',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Assets.icons.search.svg(),
            ),
            onChanged: (value) => _debouncer.run(
              (() {
                context.read<PosProductSearchCubit>().setSearchKey(value);
                context.read<ProductCatalogCubit>().getProductCatalog(
                      search: value,
                      isInitialSearch: true,
                    );
              }),
            ),
          ),
          const UIVerticalSpace(36),
          BlocBuilder<ProductCatalogCubit, ProductCatalogState>(
            builder: (context, state) {
              if (state is ProductCatalogLoaded) {
                // return Text(state.products.toString());
                return Expanded(child: ProductCatalogDataGrid(state.products));
              }

              if (state is ProductCatalogFailure) {
                return Text(state.message);
              }

              if (state is ProductCatalogLoading) {
                return Text('loading');
                // return DataGridLoading(
                //   columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
                //   source: ProductCatalogDataSource([], context),
                // );
              }

              return Text('else');
              // return DataGridNoData(
              //   columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
              //   source: ProductCatalogDataSource([], context),
              //   isCustom: true,
              //   message: 'No data available',
              // );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
