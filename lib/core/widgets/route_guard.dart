import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/auth_session/presentation/blocs/session/session_bloc.dart';
import 'package:medglobal_admin_portal/pos/authentication/presentation/presentation/screens/pos_login_screen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RouteGuard extends StatelessWidget {
  const RouteGuard({
    super.key,
    required this.child,
    required this.allowedRoles,
    required this.allowedPlatforms,
  });

  final Widget child;
  final List<UserType> allowedRoles;
  final List<PlatformType> allowedPlatforms;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState || state is AuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: UIColors.primary,
              strokeWidth: 2,
            ),
          );
        }

        if (state is AuthenticatedState) {
          final isUserAllowed = allowedRoles.contains(state.user.type);
          final isPlatformAllowed = allowedPlatforms.contains(AppConfig.platform);

          if (isUserAllowed && isPlatformAllowed) return child;
        }

        return Scaffold(
          body: Column(
            children: [
              Assets.icons.cube.setSize(24),
              UIText.heading5('Access Denied'),
              UIText.labelMedium('Sorry, you do not have the permission to access this page.'),
            ],
          ),
        );
      },
    );
  }
}
