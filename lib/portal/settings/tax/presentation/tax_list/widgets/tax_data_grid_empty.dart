import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/empty_grid_widget.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_form/tax_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TaxDataGridEmpty extends StatelessWidget {
  const TaxDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) => EmptyGridWidget(
        title: Strings.taxEmptyTitle,
        subtitle: Strings.taxEmptySubtitle,
        action: UIButton.filled(
          Strings.taxCreate,
          icon: Assets.icons.add.setSize(12.0),
          onClick: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => TaxFormDialog(cubit: context.read<TaxFormCubit>()),
          ),
        ),
      );
}
