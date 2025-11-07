import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/enums/user_enum.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';

String? redirect(
  BuildContext context,
  GoRouterState state, {
  required String? Function(UserType? role) roleRedirect,
}) {
  final authState = context.read<AuthBloc>().state;
  final isLoginRoute = state.matchedLocation == '/login';

  // Not logged in and not on login page → redirect to login
  if (authState is UnauthenticatedState && !isLoginRoute) {
    return '/login';
  }

  // Logged in but on login page → redirect to role-appropriate page
  if (authState is AuthenticatedState && isLoginRoute) {
    return roleRedirect(authState.user.type);
  }

  return null;
}
