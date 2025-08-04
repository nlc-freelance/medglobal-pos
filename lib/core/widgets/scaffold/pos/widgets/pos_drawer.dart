import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/pages/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register/active_register_cubit.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_bloc/sync_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

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
      child: ListView(
        children: [
          ListTile(
            title: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => state is AuthenticatedState
                  ? UIText.heading5('${state.user.firstName} ${state.user.lastName}')
                  : const SizedBox(),
            ),
            subtitle: UIText.bodyRegular('Cashier', color: UIColors.textMuted),
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
                color: routerState.matchedLocation == '/pos/register' ? UIColors.background : UIColors.textRegular,
              ),
              onTap: () => context.goNamed('registerPage'),
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
                color: routerState.matchedLocation == '/pos/transactions' ? UIColors.background : UIColors.textRegular,
              ),
              onTap: () => context.goNamed('transactionPage'),
            ),
          ),
          BlocBuilder<ActiveRegisterCubit, ActiveRegisterState>(
            builder: (context, state) {
              return Visibility(
                  visible: state.isOpen,
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
                                  dateTime: state.openedAt,
                                  onConfirm: (amount) => context
                                      .read<RegisterShiftBloc>()
                                      .add(RegisterShiftClosed(id: state.id!, amount: amount)),
                                )),
                      ),
                    ),
                  ));
            },
          ),
          const UIVerticalSpace(12),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              title: UIText.bodyRegular('Logout'),
              onTap: () {
                showConfirmDialog(
                  context,
                  title: 'Are you sure you want to logout?',
                  // content: context.read<SyncBloc>().state.maybeWhen(
                  //       syncing: () => Column(
                  //         children: [UIText.heading6('There is an ongoing sync')],
                  //       ),
                  //       orElse: () => const SizedBox(),
                  //     ),
                  content: UIText.heading6('---'),
                  onConfirm: () {
                    context.read<LazyListBloc<Register>>().add(const LazyListEvent<Register>.reset());
                    context.read<ActiveRegisterCubit>().reset();

                    // if (AppConfig.isPOSApp) context.read<SyncBloc>().add(const SyncEvent.stop());

                    context.read<AuthBloc>().add(const LogoutEvent());
                  },
                );
                // context.read<RegisterShiftBloc>().add(ResetRegisterShiftOnLogoutEvent());
                // context.read<PosProductListCubit>().reset();
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
    );
  }
}
