import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/cubit/register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_form/register_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterHeader extends StatelessWidget with DialogMixin {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PageHeader(
        title: Strings.posRegisterTitle,
        subtitle: Strings.posRegisterSubtitle,
        actions: [
          UIButton.filled(
            Strings.posRegisterCreate,
            icon: Assets.icons.add.setSize(12.0),
            onClick: () => showCustomDialog(
              context,
              dialog: MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<RegisterFormCubit>()),
                  BlocProvider.value(value: context.read<RegisterBloc>()),
                ],
                child: const RegisterFormDialog(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
