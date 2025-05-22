import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_list/widgets/tax_list.dart';

class TaxListPage extends StatelessWidget {
  const TaxListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<PaginatedListBloc<Tax>>()..add(const PaginatedListEvent<Tax>.fetch())),
        BlocProvider(create: (_) => TaxFormCubit()),
        BlocProvider(create: (_) => GetIt.I<TaxBloc>()),
      ],
      child: const TaxList(),
    );
  }
}
