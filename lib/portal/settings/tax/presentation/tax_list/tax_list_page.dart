import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_list_bloc/tax_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/loader.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_data_grid/tax_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_header.dart';

class TaxListPage extends StatelessWidget {
  const TaxListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => TaxListBloc(GetIt.I<TaxRepository>())
            ..add(
              const TaxListEvent.getTaxCodes(),
            ),
        ),
        BlocProvider(create: (_) => TaxBloc(GetIt.I<TaxRepository>())),
        BlocProvider(create: (_) => TaxFormCubit()),
      ],
      child: const TaxListView(),
    );
  }
}

class TaxListView extends StatelessWidget {
  const TaxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaxBloc, TaxState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => FullLoader.show(context),
          success: (_, message) => _onActionCompleted(context, message),
          deleted: (message) => _onActionCompleted(context, message),
          failure: (message) => FullLoader.close(),
          orElse: () {},
        );
      },
      child: const Column(
        children: [
          TaxHeader(),
          Expanded(child: TaxDataGrid()),
        ],
      ),
    );
  }

  /// Refreshes tax code list view.
  /// Displays toast notification and closes page loader
  void _onActionCompleted(BuildContext context, String message) {
    context.read<TaxListBloc>().add(const TaxListEvent.getTaxCodes());

    ToastNotification.success(context, message);
    FullLoader.close();
  }
}
