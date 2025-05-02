import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/empty_grid_widget.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/cubit/pos_register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/pos_register_form/pos_register_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosRegisterDataGridEmpty extends StatelessWidget {
  const PosRegisterDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) => EmptyGridWidget(
        title: Strings.posRegisterEmptyTitle,
        subtitle: Strings.posRegisterEmptySubtitle,
        action: UIButton.filled(
          Strings.posRegisterCreate,
          icon: Assets.icons.add.setSize(12.0),
          onClick: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => PosRegisterFormDialog(cubit: context.read<PosRegisterFormCubit>()),
          ),
        ),
      );
}
