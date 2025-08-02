import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/routing/portal_routes.dart';
import 'package:medglobal_admin_portal/core/routing/pos_routes.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/pages/login_page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/product_list_page.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_order_list_page.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/pos/point_of_sale_page.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: LoginPage.route,
    routes: [
      GoRoute(
        path: LoginPage.route,
        pageBuilder: (_, __) => const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        path: AccessDeniedPage.route,
        pageBuilder: (_, __) => const NoTransitionPage(child: AccessDeniedPage()),
      ),
      if (AppConfig.isPortalApp) portalRoutes,
      if (AppConfig.isPOSApp) posRoutes,
    ],
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final isLoginRoute = state.matchedLocation == LoginPage.route;

      // Not logged in and not on login page → redirect to login
      if (authState is UnauthenticatedState && !isLoginRoute) {
        return LoginPage.route;
      }

      // Logged in but on login page → redirect to role-appropriate page
      if (authState is AuthenticatedState && isLoginRoute) {
        final userRole = authState.user.type;

        if (AppConfig.isPortalApp) {
          switch (userRole) {
            case UserType.admin:
              return ProductListPage.route;
            case UserType.supervisor:
              return PurchaseOrderListPage.route;
            default:
              return AccessDeniedPage.route;
          }
        }

        if (AppConfig.isPOSApp) {
          if (userRole == UserType.cashier || userRole == UserType.supervisor) {
            return PointOfSalePage.route;
          } else {
            return AccessDeniedPage.route;
          }
        }

        // Unknown platform fallback
        return AccessDeniedPage.route;
      }

      return null;
    },
  );
}

enum PlatformType { web, desktop }

class AppConfig {
  static const platform = kIsWeb ? PlatformType.web : PlatformType.desktop;

  static bool get isPortalApp => platform == PlatformType.web;
  static bool get isPOSApp => platform == PlatformType.desktop;
}

// const accessMatrix = {
//   PlatformType.web: [UserType.admin, UserType.supervisor],
//   PlatformType.desktop: [UserType.cashier, UserType.supervisor],
// };

// bool canAccess(UserType type) {
//   return accessMatrix[AppConfig.platform]?.contains(type) ?? false;
// }

class AccessDeniedPage extends StatelessWidget {
  static String route = '/access-denied';

  const AccessDeniedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.cube.setSize(24),
        UIText.heading5('Unauthorized Access'),
        UIText.labelMedium(
          'Your account is not authorized to use this application. \n Contact your administrator if you believe this is an error.',
        ),
      ],
    );
  }
}
