import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/employee_actions.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/employee_general_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/employee_role_access_section.dart';

class EmployeeFormPage extends StatelessWidget {
  const EmployeeFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PageHeader(title: 'Add Employee'),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                EmployeeGeneralSection(),
                EmployeeRoleAccessSection(),
              ],
            ),
          ),
        ),
        EmployeeActions(),
      ],
    );
  }
}
