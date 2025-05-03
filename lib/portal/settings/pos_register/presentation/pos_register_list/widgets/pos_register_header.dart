import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/cubit/pos_register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/pos_register_form/pos_register_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosRegisterHeader extends StatelessWidget with DialogMixin {
  const PosRegisterHeader({super.key});

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
              dialog: PosRegisterFormDialog(cubit: context.read<PosRegisterFormCubit>()),
            ),
          )
        ],
      ),
    );
  }
}
