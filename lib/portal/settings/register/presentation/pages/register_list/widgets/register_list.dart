import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
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
        submitting: () => PageLoader.show(context),
        success: (message) => _onSubmitSuccess(context, message),
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

  void _onSubmitSuccess(BuildContext context, String message) {
    context.read<PaginatedListBloc<Register>>().add(const PaginatedListEvent.fetch());

    ToastNotification.success(context, message);
    PageLoader.close();

    Navigator.of(context, rootNavigator: true).pop(); // Close dialog
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    ToastNotification.error(context, message);
  }
}
