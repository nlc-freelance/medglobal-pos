import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchDataGridEmpty extends StatelessWidget {
  const BranchDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) => DataGridEmpty(
        title: Strings.taxEmptyTitle,
        subtitle: Strings.taxEmptySubtitle,
        action: UIButton.filled(
          Strings.taxCreate,
          icon: Assets.icons.add.setSize(12.0),
          onClick: () {},
        ),
      );
}
