import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_form/tax_form_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TaxHeader extends StatelessWidget with DialogMixin {
  const TaxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PageHeader(
        title: Strings.taxTitle,
        subtitle: Strings.taxSubtitle,
        actions: [
          UIButton.filled(
            Strings.taxCreate,
            icon: Assets.icons.add.setSize(12.0),
            onClick: () => showCustomDialog(context, dialog: TaxFormDialog(cubit: context.read<TaxFormCubit>())),
          )
        ],
      ),
    );
  }
}
