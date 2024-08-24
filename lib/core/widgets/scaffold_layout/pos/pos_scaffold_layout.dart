import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/pos_app_nav_bar.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

import 'lazy_load_dropdown.dart';

class POSScaffoldLayout extends StatefulWidget {
  const POSScaffoldLayout({
    super.key,
    required this.routerState,
    required this.navigationShell,
  });

  final GoRouterState routerState;
  final StatefulNavigationShell navigationShell;

  @override
  State<POSScaffoldLayout> createState() => _POSScaffoldLayoutState();
}

class _POSScaffoldLayoutState extends State<POSScaffoldLayout> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<RegisterCubit>().state.register == null
          ? showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return Dialog(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      child: Container(
                        color: UIColors.background,
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            UIText.heading5('POS Register'),
                            const Divider(color: UIColors.borderMuted),
                            const UIVerticalSpace(16),
                            Text('Please choose the register you need to use', style: UIStyleText.bodyRegular),
                            const UIVerticalSpace(30),
                            const LazyLoadDropdown(),
                            // SearchDropdown<Register>.single(
                            //   hint: 'Select a register',
                            //   label: 'Register',
                            //   itemAsString: (register) => register.name!,
                            //   asyncItemsCallback: GetIt.I<RegisterRepository>().getAllRegisters(),
                            //   onSelectItem: (register) async {
                            //     context.read<RegisterCubit>().setRegister(register);
                            //
                            //     RegisterShift? shiftDetail = register.shiftDetail;
                            //
                            //     if (shiftDetail != null) {
                            //       if (shiftDetail.status == 'open') {
                            //         context
                            //             .read<RegisterShiftBloc>()
                            //             .add(SetShiftAsOpenOnLoginEvent(shiftDetail: shiftDetail));
                            //       }
                            //       if (shiftDetail.status == 'close') {
                            //         context
                            //             .read<RegisterShiftBloc>()
                            //             .add(SetShiftAsClosedOnLoginEvent(shiftDetail: shiftDetail));
                            //       }
                            //     } else {
                            //       context.read<RegisterShiftBloc>().add(SetShiftAsClosedOnFirstTimeEvent());
                            //     }
                            //   },
                            // ),
                            const UIVerticalSpace(30),
                            if (state.error != null) UIText.labelSemiBold(state.error!, color: UIColors.buttonDanger),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: UIButton.filled(
                                'Confirm',
                                onClick: () {
                                  if (state.register != null) {
                                    context.read<RegisterItemListRemoteCubit>().getRegisterItems();
                                    Navigator.pop(context);
                                  } else {
                                    context.read<RegisterCubit>().setRegister(null);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : context.read<RegisterItemListRemoteCubit>().getRegisterItems(),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterShiftBloc, RegisterShiftState>(
      listener: (context, state) {
        if (state is ShowClosingShiftDialog) {
          _showClosingDialog(
            context,
            formKey: _formKey,
            datetime: state.openSince,
            amountController: _amountController,
            onAction: () => context.read<RegisterShiftBloc>().add(
                  CloseRegisterShiftEvent(
                    /// We made sure that there is a register set after logging in POS
                    registerId: context.read<RegisterCubit>().state.register!.id!,
                    closingAmount: double.tryParse(_amountController.text) ?? 0,
                  ),
                ),
          );
        }
      },
      child: Portal(
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
                    selected: widget.routerState.matchedLocation == '/point-of-sale/register',
                    selectedTileColor: UIColors.primary,
                    title: UIText.bodyRegular(
                      'Register',
                      color: widget.routerState.matchedLocation == '/point-of-sale/register'
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
                    selected: widget.routerState.matchedLocation == '/point-of-sale/transactions',
                    selectedTileColor: UIColors.primary,
                    title: UIText.bodyRegular(
                      'Transactions',
                      color: widget.routerState.matchedLocation == '/point-of-sale/transactions'
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
                      context.read<TransactionListByBranchCubit>().reset();
                      context.read<TransactionCubit>().reset();
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
            child: Container(margin: const EdgeInsets.all(16), child: POSAppNavBar(widget.routerState)),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
            child: widget.navigationShell,
          ),
        ),
      ),
    );
  }
}

void _showClosingDialog(
  BuildContext context, {
  required DateTime datetime,
  required GlobalKey<FormState> formKey,
  required TextEditingController amountController,
  required VoidCallback onAction,
}) =>
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Form(
        key: formKey,
        child: BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
          listener: (context, state) {
            if (state is RegisterShiftOpen || state is RegisterShiftClose) {
              Navigator.pop(context);
              amountController.clear();
            }
          },
          builder: (context, state) {
            return Dialog(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Container(
                color: UIColors.background,
                width: MediaQuery.sizeOf(context).width * 0.35,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UIText.heading6('Close register shift'),
                    const Divider(color: UIColors.borderMuted),
                    const UIVerticalSpace(24),
                    Text(
                      'Open since ${DateFormat('EEEE, d MMMM yyyy h:mm a').format(datetime.toLocal())}',
                      style: UIStyleText.bodyRegular.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const UIVerticalSpace(30),
                    UIText.labelMedium('Closing Amount'),
                    const UIVerticalSpace(8),
                    UITextFormField.noLabel(
                      hint: 'PHP 0',
                      width: 200,
                      controller: amountController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter the closing register cash.';
                        }
                        return null;
                      },
                    ),
                    const UIVerticalSpace(30),
                    if (state is RegisterShiftError) ...[
                      UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                      const UIVerticalSpace(30),
                    ],
                    CancelActionButton(
                      onCancel: () => context.read<RegisterShiftBloc>().add(HideClosingShiftDialogEvent()),
                      actionLabel: 'Confirm',
                      isLoading: state is RegisterShiftLoading,
                      onAction: () {
                        if (formKey.currentState?.validate() == true) onAction();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
