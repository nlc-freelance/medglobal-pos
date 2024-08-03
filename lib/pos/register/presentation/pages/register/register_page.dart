import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_repository.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/cart_closed.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/register/register_items_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterPage extends StatefulWidget {
  static String route = '/point-of-sale/register';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;
  late TextEditingController _searchController;

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _searchController = TextEditingController();

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
                            SearchDropdown<Register>.single(
                              hint: 'Select a register',
                              label: 'Register',
                              itemAsString: (register) => register.name!,
                              asyncItemsCallback: GetIt.I<RegisterRepository>().getAllRegisters(),
                              onSelectItem: (value) => context.read<RegisterCubit>().setRegister(value),
                            ),
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
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UISearchField(
                  fieldWidth: 500.0,
                  hint: 'Search',
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Assets.icons.search.svg(),
                  ),
                  controller: _searchController,
                  onChanged: (value) => _debouncer.run(
                    (() => context.read<RegisterItemListRemoteCubit>().getRegisterItems(search: value)),
                  ),
                ),
                const UIVerticalSpace(16),
                BlocBuilder<RegisterItemListRemoteCubit, RegisterItemListRemoteState>(
                  builder: (context, state) {
                    if (state is RegisterItemListInitial) {
                      return DataGridNoData(
                        columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                        source: RegisterItemsDataSource([]),
                        message: 'please select a register first',
                      );
                    }
                    if (state is RegisterItemListError) {
                      return Text(state.message);
                    }
                    if (state is RegisterItemListLoaded) {
                      return Expanded(
                        child: RegisterItemsDataGrid(state.items),
                      );
                    }

                    return DataGridLoading(
                      columns: DataGridUtil.getColumns(DataGridColumn.REGISTER_ITEMS),
                      source: RegisterItemsDataSource([]),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const UIHorizontalSpace(16),
        BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
          builder: (context, state) {
            return Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: FutureBuilder(
                    future: SharedPreferencesService.isShiftOpen(),
                    builder: (context, snapshot) {
                      return snapshot.data == true
                          ? const CartOpen()
                          : CartClosed(
                              onOpenShift: () => _showOpeningClosingDialog(
                                context,
                                formKey: _formKey,
                                isOpening: true,
                                datetime: DateTime.now(), // replace with date from register
                                amountController: _amountController,
                                onAction: () => context.read<RegisterShiftBloc>().add(
                                      OpenRegisterShiftEvent(
                                        /// we made sure that there is a register set after logging in POS
                                        registerId: context.read<RegisterCubit>().state.register!.id!,
                                        openingAmount: double.tryParse(_amountController.text) ?? 0,
                                      ),
                                    ),
                              ),
                            );
                    }),
              ),
            );
          },
        ),
      ],
    );
  }
}

void _showOpeningClosingDialog(
  BuildContext context, {
  required bool isOpening,
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
                    UIText.heading6('${isOpening ? 'Open' : 'Close'} register shift'),
                    const Divider(color: UIColors.borderMuted),
                    const UIVerticalSpace(24),
                    Text(
                      '${isOpening ? 'Closed' : 'Open'} since ${DateFormat('EEEE, d MMMM yyyy h:mm a').format(datetime.toLocal())}',
                      style: UIStyleText.bodyRegular.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const UIVerticalSpace(30),
                    UIText.labelMedium('${isOpening ? 'Opening' : 'Closing'} Amount'),
                    const UIVerticalSpace(8),
                    UITextFormField.noLabel(
                      hint: 'PHP 0',
                      width: 200,
                      controller: amountController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter the ${isOpening ? 'initial' : 'closing'} register cash.';
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
                      onCancel: () => isOpening
                          ? Navigator.pop(context)
                          : context.read<RegisterShiftBloc>().add(HideClosingShiftDialogEvent()),
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
