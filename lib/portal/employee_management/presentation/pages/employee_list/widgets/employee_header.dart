import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeHeader extends StatelessWidget {
  const EmployeeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PageHeader(
        title: 'Employees',
        subtitle: 'Lorem ipsum dolor',
        actions: [
          UIButton.filled(
            'New Employee',
            icon: Assets.icons.add.setSize(12.0),
            onClick: () => context.goNamed(SideMenuTreeItem.newEmployee.name),
          )
        ],
      ),
    );
  }
}
