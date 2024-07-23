import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RouteGuard extends StatelessWidget {
  const RouteGuard({super.key, required this.child, required this.allowedTypes});

  final Widget child;
  final List<UserType> allowedTypes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state is AuthenticatedState && allowedTypes.contains(state.user.type)
            ? child
            : Scaffold(
                body: Center(
                  child: state is AuthInitialState
                      ? const CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)
                      : UIText.heading6('Sorry, you do not have the correct role to access this page.'),
                ),
              );
      },
    );
  }
}
