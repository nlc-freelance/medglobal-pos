import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/app_gap.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/bloc/supplier_bloc.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/widgets/supplier_data_grid.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/widgets/supplier_list_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplierListPage extends StatelessWidget {
  const SupplierListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<PaginatedListBloc<Supplier>>()..add(const PaginatedListEvent<Supplier>.fetch()),
        ),
        BlocProvider(create: (_) => SupplierListFilterCubit()),
        BlocProvider(create: (context) => GetIt.I<SupplierBloc>()),
        // TODO: Create SupplierFormCubit
      ],
      child: const SupplierList(),
    );
  }
}

class SupplierList extends StatefulWidget {
  const SupplierList({super.key});

  @override
  State<SupplierList> createState() => _SupplierListState();
}

class _SupplierListState extends State<SupplierList> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SupplierBloc, SupplierState>(
        listener: (_, state) {
          state.maybeWhen(
            processing: () => PageLoader.show(context),
            success: (message) => _onSuccess(context, message),
            failure: (message) => _onFailure(context, message),
            orElse: () => {},
          );
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
                  // TODO: Refactor supplier form
                  onClick: () => showGeneralDialog(
                    // barrierLabel: create(context).toString(),
                    barrierDismissible: false,
                    transitionDuration: const Duration(milliseconds: 300),
                    context: context,
                    pageBuilder: (_, animation1, animation2) => BlocProvider.value(
                      value: context.read<SupplierBloc>(),
                      child: const SupplierFormDialog(),
                    ),
                    transitionBuilder: (context, animation1, animation2, child1) {
                      return SlideTransition(
                        position: Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(animation1),
                        child: child1,
                      );
                    },
                  ),
                ),
              ],
            ),
            const AppGap.v(16),
            const SupplierListToolbar(),
            const AppGap.v(16),
            const Expanded(child: SupplierDataGrid())
          ],
        ));
  }

  void _onSuccess(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.success(context, message);
    context.read<PaginatedListBloc<Supplier>>().add(const PaginatedListEvent.fetch());
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
