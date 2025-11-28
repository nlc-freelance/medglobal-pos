import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/cubit/register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_list/widgets/register_list.dart';

class RegisterListPage extends StatelessWidget {
  const RegisterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.I<PaginatedListBloc<Register>>()..add(const PaginatedListEvent<Register>.fetch()),
        ),
        BlocProvider(create: (_) => RegisterFormCubit()),
        BlocProvider(create: (_) => GetIt.I<RegisterBloc>()),
      ],
      child: const RegisterList(),
    );
  }
}
