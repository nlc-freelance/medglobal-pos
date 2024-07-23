import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_repository.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();

    if (context.read<RegisterCubit>().state.register == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => showDialog(
          context: context,
          barrierDismissible: true, // false
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
        ),
      );
    }
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
          _showOpeningClosingDialog(
            context,
            formKey: _formKey,
            isOpening: false,
            datetime: DateTime.now(),
            amountController: _amountController,
            onAction: () => context.read<RegisterShiftBloc>().add(
                  CloseRegisterShiftEvent(
                    /// we made sure that there is a register set after loggin in POS
                    registerId: context.read<RegisterCubit>().state.register!.id!,
                    closingAmount: double.tryParse(_amountController.text) ?? 0,
                  ),
                ),
          );
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: UIColors.borderMuted, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const Text('Register Data Grid'),
            ),
          ),
          const UIHorizontalSpace(16),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: UIColors.borderMuted, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.infoCircle.svg(width: 40, colorFilter: UIColors.borderRegular.toColorFilter),
                  const UIVerticalSpace(8),
                  Text('CLOSED', style: UIStyleText.headline.copyWith(fontSize: 48)),
                  const UIVerticalSpace(30),
                  Text('Open register shift', style: UIStyleText.bodyRegular.copyWith(fontSize: 14)),
                  const UIVerticalSpace(4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text(
                      'To start making transactions, open shift and input the initial register cash.',
                      style: UIStyleText.hint.copyWith(fontSize: 12.8),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const UIVerticalSpace(24),
                  UIButton.filled(
                    'Open Shift',
                    onClick: () => _showOpeningClosingDialog(
                      context,
                      formKey: _formKey,
                      isOpening: true,
                      datetime: DateTime.now(),
                      amountController: _amountController,
                      onAction: () => context.read<RegisterShiftBloc>().add(
                            OpenRegisterShiftEvent(
                              /// we made sure that there is a register set after loggin in POS
                              registerId: context.read<RegisterCubit>().state.register!.id!,
                              openingAmount: double.tryParse(_amountController.text) ?? 0,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
            if (state is RegisterShiftOpen || state is RegisterShiftClosed) Navigator.pop(context);
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
                      '${isOpening ? 'Opened' : 'Closed'} since ${DateFormat('EEEE, d MMMM yyyy h:mm a').format(datetime.toLocal())}',
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
                    if (state is RegisterShiftError) UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                    CancelActionButton(
                      onCancel: () => Navigator.pop(context),
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
