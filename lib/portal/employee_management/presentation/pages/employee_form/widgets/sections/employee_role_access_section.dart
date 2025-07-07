import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/access_control_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/system_access_section.dart';

class EmployeeRoleAccessSection extends StatelessWidget {
  const EmployeeRoleAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageSectionTitle(title: 'Role and Access Control'),
        RoleSection(),
        SystemAccessSection(),
        AccessControlSection(),
      ],
    );
  }
}
