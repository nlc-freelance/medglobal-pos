import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/loading_data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SuppliersPage extends StatelessWidget {
  const SuppliersPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => GetIt.I<SupplierListCubit>()..getSuppliers(),
        child: const _SuppliersPage(),
      );
}

class _SuppliersPage extends StatelessWidget {
  const _SuppliersPage();

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getGridColumns(DataGridColumn.suppliers);
    final style = StyleDataGrid.base;

    return BlocListener<SupplierCubit, SupplierState>(
        listener: (_, state) {
          if (state is GetSupplierState) {
            SupplierDetailsDialog(state.supplier).showSidePeek(context);
          }
          if (state is SupplierSuccessState) {
            BlocProvider.of<SupplierListCubit>(context).getSuppliers();
            ToastNotification.success(context, state.message);
          }
          if (state is SupplierErrorState) ToastNotification.error(context, state.message);
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
            const DataGridToolbar(isDownloadable: false, searchPlaceholder: 'Search supplier name'),
            BlocBuilder<SupplierListCubit, SupplierListState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state is SupplierListErrorState) {
                  return Center(child: Text(state.message));
                }
                if (state is GetSupplierListState) {
                  return Expanded(
                    child: DataGrid<Supplier>(
                      data: state.suppliers,
                      columns: columns,
                      style: StyleDataGrid.rowNavigation,
                      navigationMode: GridNavigationMode.row,
                      onTap: (id) => context.read<SupplierCubit>().getSupplierById(id),
                    ),
                  );
                }
                return LoadingDataGrid<Supplier>(
                  columns: columns,
                  style: style,
                );
              },
            ),
          ],
        ));
  }
}
