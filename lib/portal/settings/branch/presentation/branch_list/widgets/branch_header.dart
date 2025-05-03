import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchHeader extends StatelessWidget {
  const BranchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PageHeader(
        title: Strings.branchTitle,
        subtitle: Strings.branchSubtitle,
        actions: [
          UIButton.filled(
            Strings.branchCreate,
            icon: Assets.icons.add.setSize(12.0),
            onClick: () => context.goNamed(SideMenuTreeItem.newBranch.name),
          )
        ],
      ),
    );
  }
}
