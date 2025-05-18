import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReceiptTemplateHeader extends StatelessWidget {
  const ReceiptTemplateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PageHeader(
        title: 'Receipt Template',
        subtitle: 'View and manage receipt templates. Configure what details should show or hide in the receipt.',
        actions: [
          UIButton.filled(
            'New Receipt Template',
            icon: Assets.icons.add.setSize(12.0),
            onClick: () => context.goNamed(SideMenuTreeItem.newBranch.name),
          )
        ],
      ),
    );
  }
}
