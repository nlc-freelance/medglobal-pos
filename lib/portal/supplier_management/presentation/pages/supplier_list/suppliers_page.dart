import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/widgets/supplier_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SuppliersPage extends StatefulWidget {
  static String route = SideMenuTreeItem.SUPPLIERS.route;

  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  late SupplierListCubit _supplierListCubit;

  @override
  void initState() {
    super.initState();
    _supplierListCubit = BlocProvider.of<SupplierListCubit>(context)..getSuppliers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupplierCubit, SupplierState>(
        listener: (_, state) {
          if (state is SupplierSuccess) {
            _supplierListCubit.getSuppliers();
            ToastNotification.success(context, state.message);
          }
          if (state is SupplierError) ToastNotification.error(context, state.message);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Suppliers',
              subtitle: Strings.subtitlePlaceholder,
              actions: [
                UIButton.filled(
                  'New Supplier',
                  icon: Assets.icons.add.setSize(12.0),
                  onClick: () => SupplierDetailsDialog().showSidePeek(context),
                ),
              ],
            ),
            DataGridToolbar(
              search: UISearchField(
                fieldWidth: 500.0,
                hint: 'Search supplier name',
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
              ),
            ),
            BlocBuilder<SupplierListCubit, SupplierListState>(
              builder: (_, state) {
                if (state is SupplierListError) {
                  return Center(child: Text(state.message));
                }
                if (state is SupplierListLoaded) {
                  return Expanded(
                    child: SupplierDataGrid(state.suppliers),
                  );
                }
                return DataGridLoading(
                  columns: DataGridUtil.getColumns(DataGridColumn.SUPPLIERS),
                  source: SupplierDataSource([]),
                );
              },
            ),
          ],
        ));
  }
}
