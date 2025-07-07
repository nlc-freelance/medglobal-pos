import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_list/widgets/data_grid/register_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/pages/register_list/widgets/register_header.dart';

class RegisterList extends StatelessWidget with DialogMixin {
  const RegisterList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) => state.maybeWhen(
        processing: () => PageLoader.show(context),
        success: (message) => _onSaveSuccess(context, message),
        deleted: (message) => _onSuccess(context, message),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      child: const Column(
        children: [
          RegisterHeader(),
          Expanded(child: RegisterDataGrid()),
        ],
      ),
    );
  }

  void _onSuccess(BuildContext context, String message) {
    // Reload the list of registers
    context.read<PaginatedListBloc<Register>>().add(const PaginatedListEvent.fetch());

    // Reload lazy list for register dropdown
    context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.fetch(forceRefresh: true));

    SnackbarUtil.success(context, message);
    PageLoader.close();
  }

  void _onSaveSuccess(BuildContext context, String message) {
    _onSuccess(context, message);
    Navigator.of(context, rootNavigator: true).pop(); // Close dialog
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
