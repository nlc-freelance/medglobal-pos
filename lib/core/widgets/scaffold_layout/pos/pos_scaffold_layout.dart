import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/routing/router.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/pos_app_nav_bar.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class POSScaffoldLayout extends StatelessWidget {
  const POSScaffoldLayout({
    super.key,
    required this.routerState,
    required this.navigationShell,
  });

  final GoRouterState routerState;
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        drawerScrimColor: UIColors.transparent,
        drawer: Container(
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
              BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
                builder: (context, state) {
                  return FutureBuilder(
                    future: SharedPreferencesService.isShiftOpen(),
                    builder: (context, snapshot) => snapshot.data == true
                        ? Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Material(
                              type: MaterialType.transparency,
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                title: UIText.bodyRegular('Close Shift'),
                                onTap: () => context.read<RegisterShiftBloc>().add(ShowClosingShiftDialogEvent()),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  );
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
                    context.read<RegisterCubit>().reset();
                    context.read<RegisterShiftBloc>().add(ResetRegisterShiftOnLogoutEvent());
                    context.read<RegisterItemListRemoteCubit>().reset();
                    context.read<OrderCubit>().reset();

                    context.read<AuthBloc>().add(const LogoutEvent());
                  },
                ),
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(margin: const EdgeInsets.all(16), child: POSAppNavBar(routerState)),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
          child: navigationShell,
        ),
      ),
    );
  }
}
