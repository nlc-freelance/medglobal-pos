import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_blurred_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_header.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_drawer.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/blocs/device_setup/device_setup_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/cubit/unsynced_operations_cubit.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/screens/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync/write_sync_bloc/write_sync_bloc.dart';
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
                      const UIVerticalSpace(10),
                      UIText.heading5('Register Deactivated'),
                      UIText.bodyRegular(
                        'This device is no longer linked to a register',
                        align: TextAlign.center,
                      ),
                      const UIVerticalSpace(16),
                      BlocBuilder<UnsyncedOperationsCubit, int>(
                        builder: (context, unsyncedOperations) {
                          return Column(
                            children: [
                              if (unsyncedOperations == 0)
                                BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
                                  builder: (context, state) => state.maybeWhen(
                                    open: (shift, __) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: 'All offline data is now synced. ',
                                            style: UIStyleText.label.copyWith(height: 1.4),
                                            children: [
                                              TextSpan(
                                                text:
                                                    'However, the shift is still open. Please close it to proceed with logout or setup.',
                                                style: UIStyleText.bodyRegular,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const UIVerticalSpace(24),
                                        UIButton.outlined(
                                          'Close Shift',
                                          onClick: () => showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) => RegisterShiftDialog(
                                              action: RegisterShiftAction.close,
                                              dateTime: shift.openedAt,
                                              onConfirm: (amount) => context
                                                  .read<RegisterShiftBloc>()
                                                  .add(RegisterShiftEvent.close(shift.id!, amount)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    orElse: () => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        UIText.bodyRegular(
                                          'Please set up again or contact your admin for assistance.',
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
                                                context
                                                    .read<DeviceSetupBloc>()
                                                    .add(const DeviceSetupEvent.rebind(reset: true));
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              else ...[
                                UIText.bodyRegular(
                                  'To prevent data loss, you must sync offline data before\nyou can log out or set up the device again.',
                                  align: TextAlign.center,
                                ),
                                const UIVerticalSpace(8),
                                UIText.labelSemiBold(
                                  'Unsynced operations: $unsyncedOperations',
                                  align: TextAlign.center,
                                ),
                                const UIVerticalSpace(24),
                                UIButton.outlined(
                                  'Sync Now',
                                  onClick: () =>
                                      context.read<WriteSyncBloc>().add(const WriteSyncEvent.syncNow(manual: true)),
                                ),
                                const UIVerticalSpace(8),
                                BlocConsumer<WriteSyncBloc, WriteSyncState>(
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
              open: (shift, hasExistingOpenShiftError) {
                // This should only show on app startup and not when user regains connection
                if (hasExistingOpenShiftError == null) {
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
                            const UIVerticalSpace(12),
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
                }
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
