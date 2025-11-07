import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/write_sync_bloc/write_sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

class PosHeader extends StatelessWidget {
  const PosHeader(this.routeState, {super.key});

  final GoRouterState routeState;

  @override
  Widget build(BuildContext context) {
    final title = routeState.matchedLocation == '/transactions'
        ? 'Transactions'
        : routeState.matchedLocation == '/settings'
            ? 'Settings'
            : (routeState.matchedLocation == '/register' ? 'Register' : 'Payment');

    return AppBar(
      surfaceTintColor: UIColors.transparent,
      backgroundColor: UIColors.background,
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Row(
        children: [
          Text(title, style: UIStyleText.label.copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 24,
            child: VerticalDivider(
              color: UIColors.borderRegular,
              thickness: 1.1,
              width: 36,
            ),
          ),
          const RegisterBranchStatus(),
        ],
      ),
      leading: IconButton(
        icon: Assets.icons.menu.setSize(20),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        BlocBuilder<ConnectivityCubit, bool>(
          builder: (context, isOnline) {
            return Row(
              children: [
                Icon(
                  isOnline ? Icons.wifi : Icons.wifi_off,
                  size: 14,
                ),
                const UIHorizontalSpace(8),
                Text(
                  isOnline ? 'Online' : 'Offline mode — all actions are saved and will sync once connection returns',
                  style: UIStyleText.hintRegular.copyWith(
                    fontWeight: FontWeight.w500,
                    color: UIColors.textRegular,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 26,
          child: VerticalDivider(
            color: UIColors.borderRegular,
            thickness: 1.1,
            width: 30,
          ),
        ),
        Row(
          children: [
            BlocBuilder<WriteSyncBloc, WriteSyncState>(
              builder: (context, state) {
                return state.maybeWhen(
                  // initial: () => Row(
                  //   children: [
                  //     const CupertinoActivityIndicator(radius: 8),
                  //     const UIHorizontalSpace(10),
                  //     Text(
                  //       'Sync Pending',
                  //       style: UIStyleText.label.copyWith(
                  //         fontSize: 14.2,
                  //         color: UIColors.textLight,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  syncing: () => Row(
                    children: [
                      const CupertinoActivityIndicator(radius: 7.5, color: UIColors.textRegular),
                      const UIHorizontalSpace(10),
                      Text(
                        'Uploading local data..',
                        style: UIStyleText.hintRegular.copyWith(
                          fontWeight: FontWeight.w500,
                          color: UIColors.textRegular,
                        ),
                      ),
                    ],
                  ),
                  synced: (lastSyncedAt, _) => Tooltip(
                    message: 'Sync now',
                    child: GestureDetector(
                      onTap: () => context.read<WriteSyncBloc>().add(const WriteSyncEvent.syncNow(manual: true)),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.cloud_done_rounded,
                              size: 14,
                              color: UIColors.success,
                            ),
                            const UIHorizontalSpace(8),
                            lastSyncedAt == null
                                ? const Text('Not synced yet')
                                : Text.rich(
                                    TextSpan(
                                      text: 'Last upload ',
                                      style: UIStyleText.hintRegular.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: UIColors.textRegular,
                                        // color: UIColors.completed,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: timeago.format(lastSyncedAt),
                                          style: UIStyleText.hintRegular.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: UIColors.textRegular,
                                            // color: UIColors.completed,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  failure: (message, lastSyncedAt, _) => Tooltip(
                    message: 'Retry sync',
                    child: GestureDetector(
                      onTap: () => context.read<WriteSyncBloc>().add(const WriteSyncEvent.syncNow(manual: true)),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.sync,
                              size: 16,
                              color: UIColors.cancelled,
                            ),
                            const UIHorizontalSpace(6),
                            Text.rich(
                              TextSpan(
                                text: 'Upload failed, ',
                                style: UIStyleText.hintRegular.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: UIColors.cancelled,
                                ),
                                children: lastSyncedAt == null
                                    ? [
                                        TextSpan(
                                          text: 'never synced',
                                          style: UIStyleText.hintRegular.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: UIColors.cancelled,
                                          ),
                                        )
                                      ]
                                    : [
                                        TextSpan(
                                          text: 'last upload ',
                                          style: UIStyleText.hintRegular.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: UIColors.cancelled,
                                          ),
                                        ),
                                        TextSpan(
                                          text: timeago.format(lastSyncedAt),
                                          style: UIStyleText.hintRegular.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: UIColors.cancelled,
                                          ),
                                        ),
                                      ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  orElse: () => Text(
                    'Nothing to sync yet',
                    style: UIStyleText.hintRegular.copyWith(
                      fontWeight: FontWeight.w600,
                      color: UIColors.textRegular,
                    ),
                  ),
                  // orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class RegisterBranchStatus extends StatelessWidget {
  const RegisterBranchStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceSetupBloc, DeviceSetupState>(
      buildWhen: (previous, current) => previous.maybeWhen(
        loading: () => current.maybeWhen(
          ready: (_) => true,
          orElse: () => false,
        ),
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          ready: (settings) => BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
            builder: (context, state) {
              return Row(
                children: [
                  Text(
                    '${settings.register.name}  /  ${settings.branch.name}',
                    style: UIStyleText.labelMedium.copyWith(fontSize: 14.2),
                  ),
                  const UIHorizontalSpace(18),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: UIColors.borderRegular),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10,
                          color: state.maybeWhen(
                            open: (_, __) => UIColors.success,
                            orElse: () => Colors.black45,
                          ),
                        ),
                        const UIHorizontalSpace(6.5),
                        Text(
                          state.maybeWhen(
                            open: (_, __) => 'Open',
                            orElse: () => 'Closed',
                          ),
                          style: UIStyleText.labelMedium.copyWith(fontSize: 14.2),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
