import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/widgets/branch_form_view.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit/branch_form_cubit.dart';

class BranchFormPage extends StatelessWidget {
  const BranchFormPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BranchFormCubit()),
        BlocProvider(create: (_) => GetIt.I<BranchBloc>()),
      ],
      child: BranchForm(id: id),
    );
  }
}

class BranchForm extends StatefulWidget {
  const BranchForm({super.key, this.id});

  final String? id;

  @override
  State<BranchForm> createState() => _BranchFormState();
}

class _BranchFormState extends State<BranchForm> with DialogMixin {
  late final BranchFormCubit _branchFormCubit;

  @override
  void initState() {
    super.initState();
    _branchFormCubit = context.read<BranchFormCubit>();

    if (_isEditMode) {
      final branchId = int.parse(widget.id!);
      context.read<BranchBloc>().add(BranchEvent.getBranchById(branchId));
    } else {
      context.read<BranchBloc>().add(const BranchEvent.getDefaultReceipt());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchFormCubit, BranchFormState>(
      listener: (context, state) {
        if (!state.isFormValid) SnackbarUtil.invalid(context);
      },
      child: BlocConsumer<BranchBloc, BranchState>(
        listener: (_, state) => state.maybeWhen(
          loaded: (branch) => _branchFormCubit.loadBranch(branch),
          processing: () => PageLoader.show(context),
          success: (message) => _onSuccess(context, message),
          failure: (message) => _onFailure(context, message),
          orElse: () => {},
        ),
        builder: (context, state) => state.maybeWhen(
          initial: () => _isEditMode ? const LoadingView() : const BranchFormView(),
          loading: () => const LoadingView(),
          loadFailed: (message) => FailureView(message),
          orElse: () => BranchFormView(isEditMode: _isEditMode),
        ),
      ),
    );
  }

  bool get _isEditMode => widget.id != null;

  void _onSuccess(BuildContext context, String message) {
    // Reload the list of branches
    context.read<PaginatedListBloc<Branch>>().add(const PaginatedListEvent<Branch>.fetch());

    // Reload lazy list for branch dropdown
    context.read<LazyListBloc<Branch>>().add(const LazyListEvent<Branch>.fetch(forceRefresh: true));

    SnackbarUtil.success(context, message);
    PageLoader.close();

    context.goNamed(SideMenuTreeItem.branch.name);
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
