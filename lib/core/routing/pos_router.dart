import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/pos_scaffold.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_splash.dart';
import 'package:medglobal_admin_portal/pos/authentication/blocs/session/session_bloc.dart';
import 'package:medglobal_admin_portal/pos/authentication/screens/pos_login_screen.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/screens/device_setup_screen.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/payment/payment_screen.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/register_screen.dart';
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
                path: '/register',
                name: 'registerScreen',
                pageBuilder: (context, state) => const NoTransitionPage(child: RegisterScreen()),
              ),
              GoRoute(
                path: '/payment',
                name: 'paymentScreen',
                pageBuilder: (context, state) => const NoTransitionPage(child: PaymentScreen()),
              ),
              GoRoute(
                path: '/transactions',
                name: 'transactionListScreen',
                pageBuilder: (context, state) => const NoTransitionPage(child: TransactionsScreen()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(path: '/splash', builder: (_, __) => const PosSplash()),
      GoRoute(
        path: '/setup',
        name: 'setupScreen',
        pageBuilder: (context, state) => const NoTransitionPage(child: DeviceSetupScreen()),
      ),
    ],
    redirect: (context, state) {
      final session = context.read<SessionBloc>().state;
      final device = context.read<DeviceSetupBloc>().state;

      final isLogin = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/splash';
      final isSetup = state.matchedLocation == '/setup';
      final isPosRegister = state.matchedLocation == '/register';

      return session.when(
        initial: () => isSplash ? null : '/splash',
        loading: () => isPosRegister ? null : '/splash',
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
    },
  );
}
