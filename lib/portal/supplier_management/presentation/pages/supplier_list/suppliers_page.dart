import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/supplier_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SuppliersPage extends StatefulWidget {
  static String route = SideMenuTreeItem.SUPPLIERS.route;

  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  late SupplierListCubit _supplierListCubit;

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _supplierListCubit = BlocProvider.of<SupplierListCubit>(context)..getSuppliers();
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupplierCubit, SupplierState>(
        listener: (_, state) {
          if (state is SupplierSuccess) {
            _supplierListCubit.getSuppliers();
            SnackbarUtil.success(context, state.message);
          }
          if (state is SupplierError) SnackbarUtil.error(context, state.message);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Suppliers',
              subtitle: 'View all suppliers and their information.',
              actions: [
                UIButton.filled(
                  'New Supplier',
                  icon: Assets.icons.add.setSize(12.0),
                  onClick: () => SupplierDetailsDialog().showSidePeek(context),
                ),
              ],
            ),
            const UIVerticalSpace(20),
            DataGridToolbar(
              search: UISearchField(
                fieldWidth: 500.0,
                hint: 'Search supplier name',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
                onChanged: (value) => _debouncer.run(
                  (() {
                    context.read<SupplierListFilterCubit>().setSearch(value);
                    context.read<SupplierListCubit>().getSuppliers(
                          search: value,
                          size: context.read<SupplierListFilterCubit>().state.size ?? 20,
                        );
                  }),
                ),
              ),
            ),
            const Expanded(child: SupplierPaginatedDataGrid())
          ],
        ));
  }
}
