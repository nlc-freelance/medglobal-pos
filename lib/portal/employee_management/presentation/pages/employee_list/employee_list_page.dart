import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/employee_list_filter_cubit/employee_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_list/widgets/data_grid/employee_data_grid.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_list/widgets/employee_header.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_list/widgets/employee_filters.dart';

class EmployeeListPage extends StatelessWidget {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeListFilterCubit(),
      child: const Column(
        children: [
          EmployeeHeader(),
          EmployeeFilters(),
          Expanded(child: EmployeeDataGrid()),
        ],
      ),
    );
  }
}
