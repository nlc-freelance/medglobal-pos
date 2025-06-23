import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeDataGridEmpty extends StatelessWidget {
  const EmployeeDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) => DataGridEmpty(
        title: 'No employees available',
        subtitle: 'You haven\'t added any employees yet.',
        action: UIButton.filled(
          'New Employee',
          icon: Assets.icons.add.setSize(12.0),
          onClick: () {},
        ),
      );
}
