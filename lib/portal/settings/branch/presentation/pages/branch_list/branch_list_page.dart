import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_list/widgets/data_grid/branch_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_list/widgets/branch_header.dart';

class BranchListPage extends StatefulWidget {
  const BranchListPage({super.key});

  @override
  State<BranchListPage> createState() => _BranchListPageState();
}

class _BranchListPageState extends State<BranchListPage> {
  late PaginatedListBloc<Branch> _branchListBloc;

  @override
  void initState() {
    super.initState();
    _branchListBloc = context.read<PaginatedListBloc<Branch>>();
    _branchListBloc.add(const PaginatedListEvent.fetch());
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BranchHeader(),
        Expanded(child: BranchDataGrid()),
      ],
    );
  }

  @override
  dispose() {
    _branchListBloc.add(const PaginatedListEvent.reset());
    super.dispose();
  }
}
