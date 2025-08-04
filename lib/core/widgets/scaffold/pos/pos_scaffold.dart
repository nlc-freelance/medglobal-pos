import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_header.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_drawer.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/register_selection_dialog.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_register/device_register_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_register/pos_session_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_list/pos_product_list_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register/active_register_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/pos/point_of_sale_page.dart';
import 'package:medglobal_admin_portal/pos/session_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosScaffold extends StatefulWidget {
  const PosScaffold({
    super.key,
    required this.route,
    required this.child,
  });

  // final GoRouterState routerState;
  // final StatefulNavigationShell navigationShell;
  final Widget child;
  final GoRouterState route;

  @override
  State<PosScaffold> createState() => _PosScaffoldState();
}

class _PosScaffoldState extends State<PosScaffold> {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (context.read<ActiveRegisterCubit>().state.id == null) {
    //     showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (BuildContext _) => BlocProvider.value(
    //         value: context.read<PosProductListCubit>(),
    //         child: RegisterSelectionDialog(
    //           onConfirm: (register) {
    //             context.read<ActiveRegisterCubit>().saveRegister(register);
    //             if (register.shiftDetail?.status == 'open') context.read<PosProductListCubit>().getPOSProducts();
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ),
    //     );
    //   }
    //
    //   if (context.read<ActiveRegisterCubit>().state.isOpen) context.read<PosProductListCubit>().getPOSProducts();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: BlocConsumer<SessionBloc, SessionState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              // context.read<SyncBloc>().add(const SyncEvent.start());
            },
            failure: (error, message, type) {
              final user = GetIt.I<UserSessionService>().user;
              final allowRetry = user != null && type == LocalDatabaseException;

              showBlurredDialog(
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
                              context.read<SessionBloc>().add(SessionEvent.initialize(user));
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
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.cube.setSize(30),
                    const UIVerticalSpace(16),
                    UIText.heading6('Setting Up Your Device'),
                    const UIVerticalSpace(8),
                    UIText.bodyRegular('We\'re loading device register details and preparing your device for use.'),
                    UIText.bodyRegular('Please wait a moment.'),
                    const UIVerticalSpace(16),
                    const CupertinoActivityIndicator(),
                  ],
                ),
              ),
            ),
            orElse: () => Scaffold(
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
        },
      ),
    );
  }
}
