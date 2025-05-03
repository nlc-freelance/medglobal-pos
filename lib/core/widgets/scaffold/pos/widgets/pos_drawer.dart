import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift.dart';
import 'package:medglobal_admin_portal/core/routing/router.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register_lazy_list/register_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosDrawer extends StatelessWidget {
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
              selected: routerState.matchedLocation == '/point-of-sale/register',
              selectedTileColor: UIColors.primary,
              title: UIText.bodyRegular(
                'Register',
                color: routerState.matchedLocation == '/point-of-sale/register'
                    ? UIColors.background
                    : UIColors.textRegular,
              ),
              onTap: () => AppRouter.router.goNamed('Register'),
            ),
          ),
          const UIVerticalSpace(12),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              selected: routerState.matchedLocation == '/point-of-sale/transactions',
              selectedTileColor: UIColors.primary,
              title: UIText.bodyRegular(
                'Transactions',
                color: routerState.matchedLocation == '/point-of-sale/transactions'
                    ? UIColors.background
                    : UIColors.textRegular,
              ),
              onTap: () => AppRouter.router.goNamed('POS Transactions'),
            ),
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
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
                // context.read<RegisterShiftBloc>().add(ResetRegisterShiftOnLogoutEvent());
                context.read<POSProductListRemoteCubit>().reset();
                context.read<TransactionListByBranchCubit>().reset();
                context.read<TransactionCubit>().reset();
                context.read<OrderCubit>().reset();

                // /// Dropdown
                context.read<RegisterLazyListCubit>().reset();

                context.read<RegisterCubit>().reset();
                context.read<AuthBloc>().add(const LogoutEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
