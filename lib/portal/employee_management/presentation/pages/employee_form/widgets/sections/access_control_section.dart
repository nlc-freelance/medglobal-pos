import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/permission.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AccessControlSection extends StatelessWidget {
  const AccessControlSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.heading6('Access Control'),
        Text(
          'Control user access by assigning specific permissions like view, create, update, delete, and export.',
          style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
        ),
        const UIVerticalSpace(16),
        PermissionTile(module: productManagement),
      ],
    );
  }
}
