import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/app_session/presentation/app_session_bloc.dart';
import 'package:medglobal_admin_portal/pos/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_bloc/sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

class PosHeader extends StatelessWidget {
  const PosHeader(this.routeState, {super.key});

  final GoRouterState routeState;

  @override
  Widget build(BuildContext context) {
    final title = routeState.matchedLocation == '/pos/transactions'
        ? 'Transactions'
        : (routeState.matchedLocation == '/pos/register' ? 'Register' : 'Order Payment');

    return AppBar(
      surfaceTintColor: UIColors.transparent,
      backgroundColor: UIColors.background,
      centerTitle: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UIText.heading6(title),
          const UIHorizontalSpace(16),
          const RegisterName(),
          const UIHorizontalSpace(16),
          const RegisterShiftStatusIndicator(),
        ],
      ),
      leading: IconButton(
        icon: Assets.icons.menu.setSize(20),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              BlocConsumer<ConnectivityCubit, bool>(
                listenWhen: (previous, current) => previous == false && current == true,
                listener: (context, connected) {
                  print('AUTOMATIC SYNC AFTER INTERNET REGAIN');
                  if (connected) context.read<SyncBloc>().add(const SyncEvent.syncNow());
                },
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    state ? Icons.wifi : Icons.signal_wifi_connected_no_internet_4,
                    size: 18,
                  ),
                ),
              ),
              InkWell(
                onTap: () => context.read<SyncBloc>().add(const SyncEvent.syncNow()),
                borderRadius: BorderRadius.circular(16),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.refresh_rounded, size: 18, color: UIColors.success),
                ),
              ),
              const UIHorizontalSpace(8),
              BlocBuilder<SyncBloc, SyncState>(
                builder: (context, state) => state.maybeWhen(
                  syncing: () => const CupertinoActivityIndicator(radius: 8),
                  synced: () => Text(
                    'Sync successful',
                    style: UIStyleText.labelMedium.copyWith(color: UIColors.success, fontSize: 12.5),
                  ),
                  failure: (message) => Text(
                    'Sync failed.',
                    style: UIStyleText.labelMedium.copyWith(color: UIColors.error, fontSize: 12.5),
                  ),
                  // synced: (lastSyncedAt) => Text(
                  //   'Sync successful – last updated on ${lastSyncedAt.toFullDateWithTimeFormat()}',
                  //   style: UIStyleText.labelMedium.copyWith(color: UIColors.success, fontSize: 12.5),
                  // ),
                  // failure: (message, lastSyncedAt) =>
                  //     Text('$message ${lastSyncedAt == null ? '' : 'Last successful synced at: $lastSyncedAt'}'),
                  orElse: () => UIText.labelMedium('Manual Sync'),
                ),
              ),
            ],
          ),
        ),

        // This is syncing for products only, we need a whole sync for all
        // Padding(
        //   padding: const EdgeInsets.only(right: 20),
        //   child: Row(
        //     children: [
        //       InkWell(
        //         onTap: () => context.read<ProductCatalogSyncBloc>().add(const ProductCatalogSyncEvent.deltaSync()),
        //         borderRadius: BorderRadius.circular(16),
        //         child: const Padding(
        //           padding: EdgeInsets.all(4.0),
        //           child: Icon(Icons.refresh_rounded, size: 18, color: UIColors.success),
        //         ),
        //       ),
        //       const UIHorizontalSpace(8),
        //       BlocBuilder<ProductCatalogSyncBloc, ProductCatalogSyncState>(
        //         builder: (context, state) => state.maybeWhen(
        //           syncing: () => const CupertinoActivityIndicator(radius: 8),
        //           synced: (lastSyncedAt) => Text(
        //             'Sync successful – last updated on ${lastSyncedAt.toFullDateWithTimeFormat()}',
        //             style: UIStyleText.labelMedium.copyWith(color: UIColors.success, fontSize: 12.5),
        //           ),
        //           failure: (message, lastSyncedAt) =>
        //               Text('$message ${lastSyncedAt == null ? '' : 'Last successful synced at: $lastSyncedAt'}'),
        //           orElse: () => const SizedBox(),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class RegisterName extends StatelessWidget {
  const RegisterName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSessionBloc, AppSessionState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (session) => Row(
            children: [
              UIText.bodyRegular('|'),
              const UIHorizontalSpace(16),
              Text(
                session.registerName,
                style: UIStyleText.labelMedium.copyWith(fontSize: 14),
              ),
            ],
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class RegisterShiftStatusIndicator extends StatelessWidget {
  const RegisterShiftStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          open: (_, __) => false,
          closed: (_) => false,
          orElse: () => true,
        );

        final isOpen = state.maybeWhen(
          open: (_, __) => true,
          orElse: () => false,
        );

        final status = isOpen ? RegisterShiftStatus.open : RegisterShiftStatus.closed;

        return isLoading
            ? const CupertinoActivityIndicator()
            : Chip(
                avatar: Container(
                  width: 6.8,
                  height: 6.8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isOpen ? UIColors.completed : UIColors.buttonDanger,
                  ),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                label: Text(
                  status.label,
                  style: UIStyleText.labelSemiBold.copyWith(
                    color: isOpen ? UIColors.completed : UIColors.buttonDanger,
                    fontSize: 13,
                  ),
                ),
                backgroundColor: UIColors.whiteBg,
                visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: UIColors.transparent),
                ),
              );
      },
    );
  }
}
