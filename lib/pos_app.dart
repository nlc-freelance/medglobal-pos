import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/routing/pos_router.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/usecases/get_auth_session.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/auth_session/presentation/blocs/session/access_validation_bloc.dart';
import 'package:medglobal_admin_portal/pos/auth_session/presentation/blocs/session/session_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/printer/printer_cubit.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/unassigned_registers/unassigned_register_list_cubit.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/cubit/unsynced_operations_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_remote/product_catalog_bloc.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/cubit/product_catalog_filter/product_catalog_filter_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/cubit/product_catalog_local/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/cart/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/sale/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/operation_sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/sync_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/transaction_list_bloc/transaction_list_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosApp extends StatelessWidget {
  const PosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()),
        BlocProvider(create: (_) => GetIt.I<LazyListBloc<Register>>()),
        BlocProvider(create: (_) => GetIt.I<SyncBloc>()),
        BlocProvider(create: (_) => GetIt.I<OperationSyncBloc>()),
        BlocProvider(create: (_) => GetIt.I<RegisterShiftBloc>()),
        BlocProvider(create: (_) => GetIt.I<ConnectivityCubit>()..monitorConnection()),
        BlocProvider(create: (_) => GetIt.I<SessionBloc>()..add(const SessionEvent.check())),
        BlocProvider(create: (_) => GetIt.I<DeviceSetupBloc>()),
        BlocProvider(create: (_) => GetIt.I<UnassignedRegisterListCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductCatalogBloc>()),
        BlocProvider(create: (_) => GetIt.I<ProductCatalogCubit>()),
        BlocProvider(create: (_) => ProductCatalogFilterCubit()),
        BlocProvider(create: (_) => CartBloc()),
        BlocProvider(create: (_) => GetIt.I<SaleBloc>()),
        BlocProvider(create: (_) => PrinterCubit()),
        BlocProvider(create: (_) => GetIt.I<PrintReceiptCubit>()),
        BlocProvider(create: (_) => GetIt.I<TransactionListBloc>()),
        BlocProvider(create: (_) => UnsyncedOperationsCubit()),
        BlocProvider(create: (_) => AccessValidationBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthenticatedState) {
                context.read<SessionBloc>().add(SessionEvent.start(state.user));
                // context.read<AccessValidationBloc>().add(AccessValidationEvent.started(state.user.id!));
              }
              if (state is UnauthenticatedState) {
                context.read<SessionBloc>().add(const SessionEvent.end());
              }
            },
          ),
          // BlocListener<AccessValidationBloc, AccessValidationState>(
          //   listener: (context, state) {
          //     state.maybeWhen(
          //       granted: (user) => context.read<SessionBloc>().add(SessionEvent.start(user)),
          //       denied: (_) => context.read<AuthBloc>().add(const LogoutEvent()),
          //       failure: (_) => context.read<AuthBloc>().add(const LogoutEvent()),
          //       orElse: () {},
          //     );
          //   },
          // ),
          BlocListener<SessionBloc, SessionState>(
            listener: (context, state) {
              PosAppRouter.router.refresh();
              state.maybeWhen(
                active: (_) => context.read<DeviceSetupBloc>().add(const DeviceSetupEvent.checkup()),
                inactive: () => context.read<AuthBloc>().add(const LogoutEvent()),
                orElse: () {},
              );
            },
          ),
          BlocListener<DeviceSetupBloc, DeviceSetupState>(
            listener: (context, state) {
              PosAppRouter.router.refresh();
              state.maybeWhen(
                ready: (_) {
                  context.read<RegisterShiftBloc>().add(const RegisterShiftEvent.checkForOpen());
                  context.read<SyncBloc>().add(const SyncEvent.start());
                  context.read<OperationSyncBloc>().add(const OperationSyncEvent.start());
                },
                orElse: () => {},
              );
            },
          ),
          BlocListener<ConnectivityCubit, bool>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, isConnected) {
              if (isConnected) {
                context.read<SessionBloc>().add(const SessionEvent.check());
              }
            },
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'MedGlobal POS',
          theme: UITheme.theme,
          routerConfig: PosAppRouter.router,
        ),
      ),
    );
  }
}
