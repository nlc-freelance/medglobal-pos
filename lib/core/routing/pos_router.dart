import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/enums/user_enum.dart';
import 'package:medglobal_admin_portal/core/routing/router.dart';
import 'package:medglobal_admin_portal/core/widgets/route_guard.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/pos_scaffold.dart';
import 'package:medglobal_admin_portal/pos/auth_session/presentation/blocs/session/access_validation_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/screens/setting_up_device_screen.dart';
import 'package:medglobal_admin_portal/pos/auth_session/presentation/blocs/session/session_bloc.dart';
import 'package:medglobal_admin_portal/pos/authentication/presentation/presentation/screens/pos_login_screen.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/screens/device_setup_screen.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/screens/settings_screen.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/payment/payment_screen.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/register_screen.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/transactions_screen.dart';

abstract class PosAppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (_, __) => const NoTransitionPage(child: PosLoginScreen()),
      ),
      ShellRoute(
        builder: (context, state, child) => PosScaffold(route: state, child: child),
        routes: [
          ShellRoute(
            pageBuilder: (context, state, child) => NoTransitionPage(child: child),
            routes: [
              GoRoute(
                path: '/pos/register',
                name: 'registerScreen',
                pageBuilder: (context, state) => const NoTransitionPage(child: RegisterScreen()),
              ),
              GoRoute(
                path: '/pos/payment',
                name: 'paymentScreen',
                pageBuilder: (context, state) => const NoTransitionPage(child: PaymentScreen()),
              ),
              GoRoute(
                path: '/pos/transactions',
                name: 'transactionListScreen',
                pageBuilder: (context, state) => const NoTransitionPage(child: TransactionsScreen()),
              ),
              // GoRoute(
              //   path: '/pos/settings',
              //   name: 'settingsScreen',
              //   pageBuilder: (context, state) => const NoTransitionPage(child: SizedBox()),
              // ),
              // GoRoute(
              //   path: '/pos/setup',
              //   name: 'setupScreen',
              //   pageBuilder: (context, state) => const NoTransitionPage(child: DeviceSetupScreen()),
              // ),
              // GoRoute(
              //   path: '/pos/setting-up',
              //   pageBuilder: (context, state) => const NoTransitionPage(child: SettingUpScreen()),
              // ),
            ],
          ),
        ],
      ),
      GoRoute(path: SplashPage.route, builder: (_, __) => SplashPage()),
      GoRoute(
        path: '/pos/setup',
        name: 'setupScreen',
        pageBuilder: (context, state) => const NoTransitionPage(child: DeviceSetupScreen()),
      ),
      // GoRoute(
      //   path: '/pos/setting-up',
      //   pageBuilder: (context, state) => const NoTransitionPage(child: SettingUpScreen()),
      // ),
    ],
    // redirect: (context, state) => redirect(
    //   context,
    //   state,
    //   roleRedirect: (role) {
    //     if (role == UserType.cashier || role == UserType.supervisor) {
    //       return SalesScreen.route;
    //     } else {
    //       return AccessDeniedPage.route;
    //     }
    //   },
    // ),
    redirect: (context, state) {
      final access = context.read<AccessValidationBloc>().state;
      final session = context.read<SessionBloc>().state;
      final device = context.read<DeviceSetupBloc>().state;

      final isLogin = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/splash';
      final isSetup = state.matchedLocation == '/pos/setup';
      final isPosRegister = state.matchedLocation == '/pos/register';
      // print(state.matchedLocation);
      // print(context.currentRoute);

      // return sessionState.maybeWhen(
      //   // initial: () => null,
      //   // loading: () => null,
      //   active: () => logginIn || splashing ? '/pos/register' : null,
      //   inactive: () => logginIn ? null : '/login',
      //   failure: (_) => '/access-denied',
      //   orElse: () => SplashPage.route,
      // );

      return session.when(
        initial: () => isSplash ? null : SplashPage.route,
        loading: () => isPosRegister ? null : SplashPage.route,
        inactive: () {
          if (isLogin) return null;
          return isSplash ? '/login' : '/login';
        },
        active: (_) {
          return device.maybeWhen(
            unready: () => '/pos/setup',
            loading: () => null,
            failure: (_) => null,
            orElse: () {
              if (isSplash || isLogin || isSetup) return '/pos/register';
              return null;
            },
          );
        },
        failure: (_) => null,
      );

      // return session.when(
      //   // Show splash only if not already there
      //   initial: () => isSplash ? null : SplashPage.route,
      //   loading: () => isPosRegister ? null : SplashPage.route,
      //   // initial: () => null,
      //   // loading: () => null,
      //
      //   // If failed, you could redirect to an error page
      //   failure: (_) => null,
      //
      //   // Inactive session → must login
      //   inactive: () {
      //     if (isLogin) return null; // already on login
      //     return isSplash ? '/login' : '/login';
      //   },
      //
      //   // Active session → go to home if still on splash or login
      //   active: (_) {
      //     print(state.matchedLocation);
      //     return device.maybeWhen(
      //       unready: () => '/pos/setup',
      //       loading: () => null,
      //       // ready: (_) => '/pos/register',
      //       failure: (_) => null,
      //       // orElse: () => null,
      //       orElse: () {
      //         if (isSplash || isLogin || isSetup) return '/pos/register';
      //         return null;
      //       },
      //     );
      //     // return device.maybeWhen(
      //     //     // unbound: () {
      //     //     //   print(state.matchedLocation);
      //     //     //   if (isLogin) return null; // if user is fresh login
      //     //     //   return '/pos/register'; // if user is still logged in
      //     //     // },
      //     //     // unbound: (_) {
      //     //     //   if (state.matchedLocation == '/login' || state.matchedLocation == '/splash') return '/pos/register';
      //     //     //   if (state.matchedLocation == '/pos/register') return '/pos/setup';
      //     //     //   return null;
      //     //     // },
      //     //     // loading: () => '/pos/setting-up',
      //     //     unready: () => '/pos/setup',
      //     //     // ready: (_) => '/pos/register',
      //     //     // ready: (_) {
      //     //     //   if (isSplash || isLogin || isSetup) return '/pos/register';
      //     //     //   return null;
      //     //     // },
      //     //     // failure: (_) => null,
      //     //     failure: (_) => null,
      //     //     orElse: () {
      //     //       // if (isSplash || isLogin || isSetup || isSettingUp) return '/pos/register';
      //     //       if (isSplash || isLogin) return '/pos/register';
      //     //       return null;
      //     //     }
      //     //     // orElse: () => null,
      //     //     );
      //     // if (isSplash || isLogin) return '/pos/register';
      //     // return null; // stay where you are
      //   },
      // );
    },
  );
}

class SplashPage extends StatelessWidget {
  static const route = '/splash';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CupertinoActivityIndicator()),
    );
  }
}
