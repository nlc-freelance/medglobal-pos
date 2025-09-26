import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/app_version.dart';
import 'package:medglobal_admin_portal/pos/auth_session/presentation/blocs/session/session_bloc.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/cubit/unsynced_operations_cubit.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/screens/settings_screen.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/screens/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/operation_sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

class PosDrawer extends StatelessWidget with DialogMixin {
  final GoRouterState routerState;

  const PosDrawer({super.key, required this.routerState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      decoration: const BoxDecoration(
        color: UIColors.background,
        boxShadow: [
          BoxShadow(
            color: UIColors.borderMuted,
            blurRadius: 2.0,
            offset: Offset(1, 0),
          ),
        ],
      ),
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      active: (user) => ListTile(
                        title: UIText.heading5('${user.firstName} ${user.lastName}'),
                        subtitle: UIText.bodyRegular(user.type!.name.toUpperCase(), color: UIColors.textMuted),
                      ),
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
                const UIVerticalSpace(40),
                Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    selected: routerState.matchedLocation == '/pos/register',
                    selectedTileColor: UIColors.primary,
                    title: UIText.bodyRegular(
                      'Register',
                      color:
                          routerState.matchedLocation == '/pos/register' ? UIColors.background : UIColors.textRegular,
                    ),
                    onTap: () => context.goNamed('registerScreen'),
                  ),
                ),
                const UIVerticalSpace(12),
                Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    selected: routerState.matchedLocation == '/pos/transactions',
                    selectedTileColor: UIColors.primary,
                    title: UIText.bodyRegular(
                      'Transactions',
                      color: routerState.matchedLocation == '/pos/transactions'
                          ? UIColors.background
                          : UIColors.textRegular,
                    ),
                    onTap: () => context.goNamed('transactionListScreen'),
                  ),
                ),
                const CloseRegisterShiftMenu(),
                const UIVerticalSpace(12),
                Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    selected: routerState.matchedLocation == '/pos/settings',
                    selectedTileColor: UIColors.primary,
                    title: UIText.bodyRegular(
                      'Settings',
                      color:
                          routerState.matchedLocation == '/pos/settings' ? UIColors.background : UIColors.textRegular,
                    ),
                    onTap: () => showCustomDialog(context, dialog: const SettingsDialog()),
                  ),
                ),
                const UIVerticalSpace(12),
                Material(
                  type: MaterialType.transparency,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    title: UIText.bodyRegular('Log out'),
                    onTap: () {
                      context.read<UnsyncedOperationsCubit>().getUnsyncedOperations();

                      showCustomDialog(
                        context,
                        barrierColor: Colors.black12,
                        dialog: Dialog(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                          backgroundColor: UIColors.background,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.logout_outlined, color: UIColors.textMuted, size: 24),
                                const UIVerticalSpace(14),
                                UIText.heading5('Are you sure you want to log out?', align: TextAlign.center),
                                const UIVerticalSpace(16),
                                BlocBuilder<UnsyncedOperationsCubit, int>(
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        if (state == 0) ...[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              UIButton.text('Cancel', onClick: () => Navigator.pop(context)),
                                              const UIHorizontalSpace(24),
                                              UIButton.outlined(
                                                'Log out',
                                                onClick: () => context.read<AuthBloc>().add(const LogoutEvent()),
                                              ),
                                            ],
                                          ),
                                        ] else ...[
                                          UIText.bodyRegular(
                                            'You have ${context.read<UnsyncedOperationsCubit>().state} unsynced operation(s).',
                                            align: TextAlign.center,
                                          ),
                                          UIText.bodyRegular(
                                            'To log out, please ensure all pending operations are fully synced.',
                                            align: TextAlign.center,
                                          ),
                                          const UIVerticalSpace(16),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              UIButton.text('Cancel', onClick: () => Navigator.pop(context)),
                                              const UIHorizontalSpace(24),
                                              UIButton.outlined(
                                                'Sync Now',
                                                onClick: () => context
                                                    .read<OperationSyncBloc>()
                                                    .add(const OperationSyncEvent.syncNow(manual: true)),
                                              ),
                                            ],
                                          ),
                                          const UIVerticalSpace(12),
                                          BlocConsumer<OperationSyncBloc, OperationSyncState>(
                                            listener: (context, state) {
                                              state.maybeWhen(
                                                synced: (_, __) =>
                                                    context.read<UnsyncedOperationsCubit>().getUnsyncedOperations(),
                                                orElse: () {},
                                              );
                                            },
                                            builder: (context, state) {
                                              return state.maybeWhen(
                                                syncing: () => const CupertinoActivityIndicator(),
                                                failure: (message, _, __) =>
                                                    UIText.labelMedium(message, color: UIColors.error),
                                                orElse: () => const SizedBox.shrink(),
                                              );
                                            },
                                          ),
                                          const UIVerticalSpace(4),
                                        ],
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      // showConfirmDialog(
                      //   context,
                      //   title: 'Are you sure you want to logout?',
                      //   content: const SizedBox.shrink(),
                      //   onConfirm: () {
                      //     // context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.reset());
                      //     // context.read<ActiveRegisterCubit>().reset();
                      //
                      //     // if (AppConfig.isPOSApp) context.read<SyncBloc>().add(const SyncEvent.stop());
                      //     context.read<AuthBloc>().add(const LogoutEvent());
                      //   },
                      // );
                      // context.read<RegisterShiftBloc>().add(ResetRegisterShiftOnLogoutEvent());
                      // context.read<ProductCatalogCubit>().reset();
                      // context.read<TransactionListByBranchCubit>().reset();
                      // context.read<TransactionCubit>().reset();
                      // context.read<OrderCubit>().reset();

                      // /// Dropdown
                      // context.read<RegisterLazyListCubit>().reset();

                      // context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.reset());
                      // context.read<ActiveRegisterCubit>().reset();

                      // Dialog to confirm logout
                      // Check if there is ongoing sync or pending items
                      // if (AppConfig.isPOSApp) context.read<SyncBloc>().add(const SyncEvent.stop());

                      // context.read<AuthBloc>().add(const LogoutEvent());
                    },
                  ),
                ),
              ],
            ),
          ),
          const AppVersion(),
        ],
      ),
    );
  }
}

class CloseRegisterShiftMenu extends StatelessWidget {
  const CloseRegisterShiftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
      listener: (context, state) {
        state.maybeWhen(
          closed: (_) => Navigator.of(context, rootNavigator: true).pop(),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          open: (shift, _) => Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Material(
                type: MaterialType.transparency,
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  title: UIText.bodyRegular('Close Shift'),
                  onTap: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => RegisterShiftDialog(
                      action: RegisterShiftAction.close,
                      dateTime: shift.openedAt,
                      onConfirm: (amount) =>
                          context.read<RegisterShiftBloc>().add(RegisterShiftEvent.close(shift.id!, amount)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
