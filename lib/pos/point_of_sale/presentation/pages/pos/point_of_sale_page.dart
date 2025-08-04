import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/device_register/pos_session_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_search/pos_product_search_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_list/pos_product_list_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_closed.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register/active_register_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/pos/pos_products_data_grid.dart';
import 'package:medglobal_admin_portal/pos/session_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PointOfSalePage extends StatefulWidget {
  static String route = '/pos/register';

  const PointOfSalePage({super.key});

  @override
  State<PointOfSalePage> createState() => _PointOfSalePageState();
}

class _PointOfSalePageState extends State<PointOfSalePage> {
  final _debouncer = Debouncer(milliseconds: 500);
  bool _isDialogShowing = false;

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<DeviceRegisterBloc, DeviceRegisterState>(
    //   listener: (context, state) {
    //     state.maybeWhen(
    //       loaded: (register) {
    //         final authState = context.read<AuthBloc>().state;
    //
    //         final user = authState is AuthenticatedState ? authState.user : null;
    //
    //         if (user == null) {
    //           SnackbarUtil.error(context,
    //               'Something went wrong while saving your user details to this device.\nOffline access may not be available.');
    //           return;
    //         }
    //
    //         context.read<SessionBloc>().add(SessionEvent.save(user, register));
    //       },
    //       orElse: () {},
    //     );
    //
    //     final shouldBlock = state.maybeWhen(
    //       unassigned: (message) => message,
    //       failure: (message) => message,
    //       orElse: () => null,
    //     );
    //
    //     if (shouldBlock?.trim().isNotEmpty == true) {
    //       showDialog(
    //         context: context,
    //         barrierDismissible: false,
    //         builder: (BuildContext _) => AlertDialog(
    //           backgroundColor: UIColors.whiteBg,
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               UIText.heading6('Register Setup Incomplete'),
    //               const UIVerticalSpace(20),
    //               UIText.bodyRegular(shouldBlock!),
    //               const UIVerticalSpace(20),
    //               UIButton.filled('Logout', onClick: () => context.read<AuthBloc>().add(const LogoutEvent())),
    //             ],
    //           ),
    //         ),
    //       );
    //     }
    //   },
    //   child:
    // return BlocConsumer<SessionBloc, SessionState>(
    //   // return BlocListener<SessionBloc, SessionState>(
    //   listener: (context, state) {
    //     print('sSsFSDFS');
    //     state.maybeWhen(
    //       success: () {
    //         // context.read<SyncBloc>().add(const SyncEvent.start());
    //       },
    //       failure: (message) {
    //         showBlurredDialog(
    //           context,
    //           isLoading: false,
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               UIText.heading5('Register Setup Incomplete'),
    //               const UIVerticalSpace(16),
    //               UIText.bodyRegular(
    //                 'The POS cannot be used on this device yet. A register must be linked to this device before it can be used. Please complete the setup or contact your administrator for assistance.',
    //                 align: TextAlign.center,
    //               ),
    //               const UIVerticalSpace(16),
    //               UIText.bodyRegular('Error: $message', color: UIColors.textGray),
    //               const UIVerticalSpace(20),
    //               UIButton.filled('Logout', onClick: () => context.read<AuthBloc>().add(const LogoutEvent())),
    //             ],
    //           ),
    //         );
    //       },
    //       orElse: () {},
    //     );
    //     //
    //     // final showLoader = state.maybeWhen(
    //     //   fetchingRegister: () => true,
    //     //   storingDetails: () => true,
    //     //   orElse: () => false,
    //     // );
    //     // if (showLoader) PageLoader.show(context);
    //   },
    //   builder: (context, state) => state.maybeWhen(
    //       loading: () => Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Assets.icons.cube.setSize(30),
    //               const UIVerticalSpace(16),
    //               UIText.heading6('Setting Up Your Device'),
    //               const UIVerticalSpace(8),
    //               UIText.bodyRegular('We\'re loading device register details and preparing your device for use.'),
    //               UIText.bodyRegular('Please wait a moment.'),
    //               const UIVerticalSpace(16),
    //               const CupertinoActivityIndicator(),
    //             ],
    //           ),
    //       orElse: () =>
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: BlocBuilder<ActiveRegisterCubit, ActiveRegisterState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<SessionBloc, SessionState>(builder: (context, state) => Text(state.toString())),
                    Text(GetIt.I<UserSessionService>().user.toString()),
                    Text(GetIt.I<UserSessionService>().register.toString()),
                    if (state.isOpen) ...[
                      UISearchField(
                        fieldWidth: double.infinity,
                        hint: 'Search',
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Assets.icons.search.svg(),
                        ),
                        onChanged: (value) => _debouncer.run(
                          (() {
                            context.read<PosProductSearchCubit>().setSearchKey(value);
                            context.read<PosProductListCubit>().getPOSProducts(
                                  search: value,
                                  isInitialSearch: true,
                                );
                          }),
                        ),
                      ),
                      const UIVerticalSpace(36),
                      BlocBuilder<PosProductListCubit, PosProductListState>(
                        builder: (context, state) {
                          // if (state is POSProductListLoading) {
                          //   return DataGridLoading(
                          //     columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                          //     source: POSProductsDataSource([], context),
                          //   );
                          // }
                          if (state is POSProductListError) {
                            return Text(state.message);
                          }
                          if (state is POSProductListLoaded) {
                            return Expanded(
                              child: PosProductsDataGrid(state.products),
                            );
                          }

                          return DataGridLoading(
                            columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                            source: PosProductsDataSource([], context),
                          );

                          // return DataGridNoData(
                          //   columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                          //   source: POSProductsDataSource([], context),
                          // );
                        },
                      ),
                    ] else
                      DataGridNoData(
                        columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                        source: PosProductsDataSource([], context),
                        isCustom: true,
                        message: 'The register is currently closed.',
                      ),
                  ],
                );
              },
            ),
          ),
        ),
        const UIHorizontalSpace(16),
        BlocBuilder<ActiveRegisterCubit, ActiveRegisterState>(
          builder: (context, state) {
            return Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: state.isOpen ? const CartOpen() : const CartClosed(),
              ),
            );
          },
        ),
      ],
    );
    // ),
    // );
  }
}

void showBlurredDialog(BuildContext context, {required bool isLoading, Widget? content}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: "BlurredDialog",
    barrierColor: Colors.transparent,
    // We will handle background ourselves
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Stack(
        children: [
          // Blurred background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(color: Colors.black12),
            ),
          ),

          // Centered dialog
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Material(
                      color: Colors.transparent,
                      child: content ?? const SizedBox(),
                    ),
            ),
          ),
        ],
      );
    },
  );
}
