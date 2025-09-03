import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_blurred_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_header.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_drawer.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/setting_up_device_screen.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/app_session/presentation/app_session_bloc.dart';
import 'package:medglobal_admin_portal/pos/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_sync_bloc/product_catalog_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_bloc/sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

class PosScaffold extends StatefulWidget {
  const PosScaffold({
    super.key,
    required this.route,
    required this.child,
  });

  final GoRouterState route;
  final Widget child;

  @override
  State<PosScaffold> createState() => _PosScaffoldState();
}

class _PosScaffoldState extends State<PosScaffold> {
  late final ConnectivityCubit connectivityCubit;
  late final SyncBloc syncBloc;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);

    connectivityCubit = context.read<ConnectivityCubit>();
    syncBloc = context.read<SyncBloc>();

    // Listen for connectivity changes
    connectivityCubit.stream.listen((status) {
      syncBloc.updateConnectivity(status);
    });
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   _isAppInForeground = state == AppLifecycleState.resumed;
  //   syncBloc.updateAppLifecycle(_isAppInForeground);
  // }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppSessionBloc, AppSessionState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (_) {
            // context.read<SyncBloc>().add(const SyncEvent.start());
            // If the posCatalog table is empty and lastSyncedAt for posCatalog table is empty, do initial fetch
            // Else if lastSyncedAt is past 10 minutes, do delta sync
            // Additionally, add hasCompletedInitialSync to be able to know if we need to continue initial fetch
            // Add a lastPage, error, so we can continue initial fetch we left of, if an error occurred
            context.read<ProductCatalogSyncBloc>().add(const ProductCatalogSyncEvent.initialFetch());
            context.read<RegisterShiftBloc>().add(const RegisterShiftEvent.checkForOpen());
          },
          failure: (message, error, type) => _showErrorDialog(context, message, error, type),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const SettingUpScreen(),
          orElse: () => _PosScaffold(widget.route, widget.child),
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message, String error, Type? type) {
    final user = GetIt.I<AppSessionService>().user;
    final allowRetry = user != null && type == LocalDatabaseException;

    return showBlurredDialog(
      context,
      isLoading: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UIText.heading5('Something went wrong'),
          const UIVerticalSpace(16),
          UIText.bodyRegular(message, align: TextAlign.center),
          const UIVerticalSpace(16),
          Text(
            'Message: $error',
            style: UIStyleText.hint,
            textAlign: TextAlign.center,
          ),
          const UIVerticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (allowRetry) ...[
                UIButton.filled(
                  'Retry',
                  onClick: () {
                    context.read<AppSessionBloc>().add(AppSessionEvent.initialize(user));
                    Navigator.pop(context);
                  },
                ),
                const UIHorizontalSpace(8),
              ],
              UIButton.filled(
                'Return to Login',
                onClick: () => context.read<AuthBloc>().add(const LogoutEvent()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PosScaffold extends StatelessWidget {
  const _PosScaffold(this.route, this.child);

  final GoRouterState route;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: UIColors.transparent,
      drawer: PosDrawer(routerState: route),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.all(16),
          child: PosHeader(route),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
        child: child,
      ),
    );
  }
}
