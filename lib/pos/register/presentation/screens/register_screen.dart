import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/cubit/product_catalog_filter/product_catalog_filter_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/cubit/product_catalog_local/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/cart/cart_closed/cart_closed.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/cart/cart_open/cart_open.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/screens/product_catalog_data_grid.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class RegisterScreen extends StatefulWidget {
  static String route = '/pos/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();

    // Temporary: Re fetch the product catalog from local to update the stock in ui
    // For later, use watch() from drift from local db to trigger ui rebuilds automatically

    context.read<ProductCatalogCubit>().getProductCatalog(isInitialSearch: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
      listener: (context, state) {
        state.maybeWhen(
          open: (_, __) => context.read<ProductCatalogCubit>().getProductCatalog(),
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
                    const SyncStatus(),
                    const UIVerticalSpace(8),
                    state.maybeWhen(
                      open: (shift, _) => const Expanded(child: ProductCatalog()),
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
                  orElse: () => const CartClosed(),
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
  State<ProductCatalog> createState() => _ProductCatalogLocalState();
}

class _ProductCatalogLocalState extends State<ProductCatalog> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UIVerticalSpace(12),
        UISearchField(
          fieldWidth: double.infinity,
          hint: 'Search',
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Assets.icons.search.svg(),
          ),
          onChanged: (value) => _debouncer.run(
            (() {
              context.read<ProductCatalogFilterCubit>().setSearch(value);
              context.read<ProductCatalogCubit>().getProductCatalog(
                    search: value,
                    isInitialSearch: true,
                  );
            }),
          ),
        ),
        const UIVerticalSpace(36),
        BlocBuilder<ProductCatalogCubit, ProductCatalogLocalState>(
          builder: (context, state) {
            if (state is ProductCatalogLoaded) {
              // return Text(state.products.toString());
              return Expanded(child: ProductCatalogDataGrid(state.products));
            }

            if (state is ProductCatalogFailure) {
              return Text(state.message);
            }

            if (state is ProductCatalogLoading) {
              // return Text('loading');
              return DataGridLoading(
                columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
                source: ProductCatalogDataSource([], context),
              );
            }

            // return Text('else');
            return DataGridNoData(
              columns: DataGridUtil.getColumns(DataGridColumn.productCatalog),
              source: ProductCatalogDataSource([], context),
              isCustom: true,
              message: 'No data available aaaa',
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}

class SyncStatus extends StatelessWidget {
  const SyncStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<SyncBloc, SyncState>(
          builder: (context, state) {
            return state.maybeWhen(
              syncing: () => Row(
                children: [
                  const CupertinoActivityIndicator(radius: 7.5, color: UIColors.textRegular),
                  const UIHorizontalSpace(10),
                  Text(
                    'Downloading data..',
                    style: UIStyleText.hintRegular.copyWith(
                      fontWeight: FontWeight.w500,
                      color: UIColors.textRegular,
                    ),
                  ),
                ],
              ),
              synced: (lastSyncedAt, _) => Tooltip(
                message: 'Sync now',
                child: GestureDetector(
                  onTap: () => context.read<SyncBloc>().add(const SyncEvent.syncNow(manual: true)),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.file_download,
                          size: 14,
                          color: UIColors.success,
                        ),
                        const UIHorizontalSpace(8),
                        lastSyncedAt == null
                            ? const Text('Not synced yet')
                            : Text.rich(
                                TextSpan(
                                  text: 'Last download ',
                                  style: UIStyleText.hintRegular.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: UIColors.textRegular,
                                    // color: UIColors.completed,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: timeago.format(lastSyncedAt),
                                      style: UIStyleText.hintRegular.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: UIColors.textRegular,
                                        // color: UIColors.completed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
              failure: (message, lastSyncedAt, _) => Tooltip(
                message: 'Retry sync',
                child: GestureDetector(
                  onTap: () => context.read<SyncBloc>().add(const SyncEvent.syncNow(manual: true)),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.sync,
                          size: 16,
                          color: UIColors.cancelled,
                        ),
                        const UIHorizontalSpace(6),
                        Text.rich(
                          TextSpan(
                            text: 'Download failed, ',
                            style: UIStyleText.hintRegular.copyWith(
                              fontWeight: FontWeight.w500,
                              color: UIColors.cancelled,
                            ),
                            children: lastSyncedAt == null
                                ? [
                                    TextSpan(
                                      text: 'never synced',
                                      style: UIStyleText.hintRegular.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: UIColors.cancelled,
                                      ),
                                    )
                                  ]
                                : [
                                    TextSpan(
                                      text: 'last download ',
                                      style: UIStyleText.hintRegular.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: UIColors.cancelled,
                                      ),
                                    ),
                                    TextSpan(
                                      text: timeago.format(lastSyncedAt),
                                      style: UIStyleText.hintRegular.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: UIColors.cancelled,
                                      ),
                                    ),
                                  ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // orElse: () => const SizedBox.shrink(),
              orElse: () => Text(
                'All data are up to date',
                style: UIStyleText.hintRegular.copyWith(
                  fontWeight: FontWeight.w600,
                  color: UIColors.textRegular,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

enum SyncData { read, write }
