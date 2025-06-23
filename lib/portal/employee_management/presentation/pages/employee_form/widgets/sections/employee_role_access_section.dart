import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/access_control_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/system_access_section.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeRoleAccessSection extends StatelessWidget {
  const EmployeeRoleAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'Role and Access Control'),
        // BlocBuilder<RoleAccessCubit, RoleAccessState>(
        //   builder: (context, state) => !state.isFormValid
        //       ? UIText.dataGridText(
        //           'Please configure the role based access controls for this employee.',
        //           color: UIColors.buttonDanger,
        //         )
        //       : const SizedBox(),
        // ),
        const RoleSection(),
        const SystemAccessSection(),
        const AccessControlSection(),
      ],
    );
  }
}
