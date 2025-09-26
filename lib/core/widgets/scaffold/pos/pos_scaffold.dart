import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_blurred_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_header.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_drawer.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/cubit/unsynced_operations_cubit.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/screens/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/operation_sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

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

class _PosScaffoldState extends State<PosScaffold> with DialogMixin {
  @override
  void initState() {
    super.initState();
    // On app startup, listen to connection changes and check for open shift
    context.read<ConnectivityCubit>().monitorConnection();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeviceSetupBloc, DeviceSetupState>(
          listener: (context, state) {
            state.maybeWhen(
              deactivated: (_) {
                context.read<UnsyncedOperationsCubit>().getUnsyncedOperations();

                return showBlurredDialog(
                  context,
                  isLoading: false,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.infoCircle.svg(width: 24, colorFilter: UIColors.textGray.toColorFilter),
                      const UIVerticalSpace(14),
                      UIText.heading5('Register Deactivated'),
                      const UIVerticalSpace(4),
                      UIText.bodyRegular(
                        'This device is no longer linked to a register.',
                        align: TextAlign.center,
                      ),
                      const UIVerticalSpace(16),
                      BlocBuilder<UnsyncedOperationsCubit, int>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              if (state == 0) ...[
                                UIText.bodyRegular(
                                  'To continue, please start the setup process to reset the device, or contact support if you require assistance.',
                                  align: TextAlign.center,
                                ),
                                const UIVerticalSpace(16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    UIButton.text(
                                      'Log Out',
                                      onClick: () => context.read<AuthBloc>().add(const LogoutEvent()),
                                    ),
                                    const UIHorizontalSpace(24),
                                    UIButton.outlined(
                                      'Set Up Again',
                                      onClick: () {
                                        context.read<DeviceSetupBloc>().add(const DeviceSetupEvent.rebind());
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                )
                              ] else ...[
                                UIText.bodyRegular(
                                  'However, there are ${context.read<UnsyncedOperationsCubit>().state} unsynced operation(s).',
                                  align: TextAlign.center,
                                ),
                                UIText.bodyRegular(
                                  'To prevent data loss, please sync all operations before logging out or setting up the device again.',
                                  align: TextAlign.center,
                                ),
                                const UIVerticalSpace(16),
                                UIButton.outlined(
                                  'Sync Now',
                                  onClick: () => context
                                      .read<OperationSyncBloc>()
                                      .add(const OperationSyncEvent.syncNow(manual: true)),
                                ),
                                const UIVerticalSpace(8),
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
                                      failure: (message, _, __) => UIText.labelMedium(message, color: UIColors.error),
                                      orElse: () => const SizedBox.shrink(),
                                    );
                                  },
                                )
                              ],
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<RegisterShiftBloc, RegisterShiftState>(
          listener: (context, state) {
            state.maybeWhen(
              open: (shift, _) {
                // This should only show on app startup and not when user regains connection
                showCustomDialog(
                  context,
                  barrierColor: Colors.black12,
                  dialog: Dialog(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    backgroundColor: UIColors.background,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.search, color: UIColors.textMuted, size: 24),
                          const UIVerticalSpace(14),
                          UIText.heading5('Open Shift Found', align: TextAlign.center),
                          const UIVerticalSpace(4),
                          UIText.bodyRegular(
                            'A previous shift is still active. You can either continue with this shift or close it and start a new one.',
                            align: TextAlign.center,
                          ),
                          const UIVerticalSpace(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UIButton.text(
                                'Continue with Shift',
                                onClick: () => Navigator.pop(context),
                              ),
                              const UIHorizontalSpace(24),
                              UIButton.outlined(
                                'Close Shift',
                                onClick: () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => RegisterShiftDialog(
                                      action: RegisterShiftAction.close,
                                      dateTime: shift.openedAt,
                                      onConfirm: (amount) => context
                                          .read<RegisterShiftBloc>()
                                          .add(RegisterShiftEvent.close(shift.id!, amount)),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        drawerScrimColor: UIColors.transparent,
        drawer: PosDrawer(routerState: widget.route),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: PosHeader(widget.route),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
          child: widget.child,
        ),
      ),
    );
  }
}
