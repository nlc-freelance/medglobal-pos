import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/tax_list/widgets/tax_header.dart';

class TaxListPage extends StatelessWidget {
  const TaxListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaxFormCubit(),
      child: const Column(
        children: [
          TaxHeader(),
          TaxDataGrid(),
        ],
      ),
    );
  }
}
