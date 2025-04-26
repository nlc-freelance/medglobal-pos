import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_closed.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/register/register_items_data_grid.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterPage extends StatefulWidget {
  static String route = '/point-of-sale/register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.isOpen) ...[
                      UISearchField(
                        fieldWidth: double.infinity,
                        hint: 'Search',
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Assets.icons.search.svg(),
                        ),
                        onChanged: (value) => _debouncer.run(
                          (() {
                            context.read<ProductSearchCubit>().setSearchKey(value);
                            context.read<POSProductListRemoteCubit>().getPOSProducts(
                                  search: value,
                                  isInitialSearch: true,
                                );
                          }),
                        ),
                      ),
                      const UIVerticalSpace(36),
                      BlocBuilder<POSProductListRemoteCubit, POSProductListRemoteState>(
                        builder: (context, state) {
                          // if (state is POSProductListLoading) {
                          //   return DataGridLoading(
                          //     columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                          //     source: POSProductsDataSource([], context),
                          //   );
                          // }
                          if (state is POSProductListError) {
                            return Text(state.message);
                          }
                          if (state is POSProductListLoaded) {
                            return Expanded(
                              child: POSProductsDataGrid(state.products),
                            );
                          }

                          return DataGridLoading(
                            columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                            source: POSProductsDataSource([], context),
                          );

                          // return DataGridNoData(
                          //   columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                          //   source: POSProductsDataSource([], context),
                          // );
                        },
                      ),
                    ] else
                      DataGridNoData(
                        columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                        source: POSProductsDataSource([], context),
                        isCustom: true,
                        message: 'The register is currently closed.',
                      ),
                  ],
                );
              },
            ),
          ),
        ),
        const UIHorizontalSpace(16),
        BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: state.isOpen ? const CartOpen() : const CartClosed(),
              ),
            );
          },
        ),
      ],
    );
  }
}
