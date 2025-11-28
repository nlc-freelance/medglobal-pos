import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/pages/tax_form/tax_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TaxDataGridEmpty extends StatelessWidget with DialogMixin {
  const TaxDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) => DataGridEmpty(
        title: Strings.taxEmptyTitle,
        subtitle: Strings.taxEmptySubtitle,
        action: UIButton.filled(
          Strings.taxCreate,
          icon: Assets.icons.add.setSize(12.0),
          onClick: () => showCustomDialog(
            context,
            dialog: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<TaxFormCubit>()),
                BlocProvider.value(value: context.read<TaxBloc>()),
              ],
              child: const TaxFormDialog(),
            ),
          ),
        ),
      );
}
