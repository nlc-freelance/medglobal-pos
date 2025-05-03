import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/cubit/pos_register_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/pos_register_list/widgets/pos_register_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/pos_register_list/widgets/pos_register_header.dart';

class PosRegisterListPage extends StatelessWidget {
  const PosRegisterListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PosRegisterFormCubit(),
      child: const Column(
        children: [
          PosRegisterHeader(),
          PosRegisterDataGrid(),
        ],
      ),
    );
  }
}
