import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_list/widgets/data_grid/branch_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_list/widgets/branch_header.dart';

class BranchListPage extends StatelessWidget {
  const BranchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BranchHeader(),
        Expanded(child: BranchDataGrid()),
      ],
    );
  }
}
