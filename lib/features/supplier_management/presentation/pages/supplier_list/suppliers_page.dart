import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/loading_data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SuppliersPage extends StatefulWidget {
  static String route = SideMenuTreeItem.suppliers.route;

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
    final columns = DataGridUtil.getGridColumns(DataGridColumn.suppliers);
    final style = StyleDataGrid.base;

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
            const DataGridToolbar(isDownloadable: false, searchPlaceholder: 'Search supplier name'),
            BlocBuilder<SupplierListCubit, SupplierListState>(
              builder: (_, state) {
                if (state is SupplierListError) {
                  return Center(child: Text(state.message));
                }
                if (state is SupplierListLoaded) {
                  return Expanded(
                    child: DataGrid<Supplier>(
                      data: state.suppliers,
                      columns: columns,
                      style: StyleDataGrid.rowNavigation,
                      navigationMode: GridNavigationMode.row,
                      onTap: (id) => SupplierDetailsDialog(state.suppliers.firstWhere((supplier) => supplier.id == id))
                          .showSidePeek(context),
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
