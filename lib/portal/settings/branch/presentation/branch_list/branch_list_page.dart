import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch1_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_list_bloc/branch_list_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_list/widgets/branch_data_grid/branch_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_list/widgets/branch_header.dart';

class BranchListPage extends StatelessWidget {
  const BranchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BranchListBloc(GetIt.I<Branch1Repository>())
            ..add(
              const BranchListEvent.getBranches(),
            ),
        ),
        BlocProvider(create: (_) => BranchBloc(GetIt.I<Branch1Repository>())),
      ],
      child: const BranchListView(),
    );
  }
}

class BranchListView extends StatelessWidget {
  const BranchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchBloc, BranchState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => PageLoader.show(context),
          success: (_, message) => _onActionCompleted(context, message),
          deleted: (message) => _onActionCompleted(context, message),
          failure: (message) => PageLoader.close(),
          orElse: () {},
        );
      },
      child: const Column(
        children: [
          BranchHeader(),
          Expanded(child: BranchDataGrid()),
        ],
      ),
    );
  }

  /// Reloads data
  /// Displays toast notification and closes page loader
  void _onActionCompleted(BuildContext context, String message) {
    context.read<BranchListBloc>().add(const BranchListEvent.getBranches());

    ToastNotification.success(context, message);
    PageLoader.close();
  }
}
