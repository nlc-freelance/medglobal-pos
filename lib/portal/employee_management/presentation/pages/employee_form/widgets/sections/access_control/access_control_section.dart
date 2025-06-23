import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/detailed_action_level_permision.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AccessControlSection extends StatelessWidget {
  const AccessControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleAccessCubit, RoleAccessState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.role == null
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText.heading6('Access Control'),
                      Text(
                        'Control user access by assigning specific permissions like view, create, update, delete, and export.',
                        style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
                      ),
                      const UIVerticalSpace(16),
                      const DetailedActionLevelPermission(),
                    ],
                  ),
            if (!state.isFormValid)
              UIText.dataGridText(
                'Please configure the role based access controls for this employee.',
                color: UIColors.buttonDanger,
              ),
          ],
        );
      },
    );
  }
}
