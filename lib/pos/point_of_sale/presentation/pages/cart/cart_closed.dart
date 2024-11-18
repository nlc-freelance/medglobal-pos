import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartClosed extends StatefulWidget {
  const CartClosed({super.key});

  @override
  State<CartClosed> createState() => _CartClosedState();
}

class _CartClosedState extends State<CartClosed> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.infoCircle.svg(width: 40, colorFilter: UIColors.borderRegular.toColorFilter),
        const UIVerticalSpace(8),
        Text('CLOSED', style: UIStyleText.headline.copyWith(fontSize: 48)),
        const UIVerticalSpace(30),
        BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
          builder: (context, state) {
            return FutureBuilder(
                future: SharedPreferencesService.hasReachedMaxShift(),
                builder: (context, snapshot) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (snapshot.data == true) ...[
                          Text('Opening shift can only be done once a day',
                              style: UIStyleText.bodyRegular.copyWith(fontSize: 14)),
                          const UIVerticalSpace(4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              'This register is now closed as you might have already opened and closed a shift today.',
                              style: UIStyleText.hint.copyWith(fontSize: 12.8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ] else ...[
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
                          BlocListener<RegisterShiftBloc, RegisterShiftState>(
                            listener: (context, state) {
                              if (state is ShowOpeningShiftDialog) {
                                _showOpeningClosingDialog(
                                  context,
                                  formKey: _formKey,
                                  datetime: state.closedSince,
                                  amountController: _amountController,
                                  onAction: () => context.read<RegisterShiftBloc>().add(
                                        OpenRegisterShiftEvent(
                                          /// We made sure that there is a register set after logging in POS
                                          registerId: context.read<RegisterCubit>().state.register!.id!,
                                          openingAmount: double.tryParse(_amountController.text) ?? 0,
                                        ),
                                      ),
                                );
                              }
                            },
                            child: UIButton.filled(
                              'Open Shift',
                              onClick: () => context.read<RegisterShiftBloc>().add(ShowOpeningShiftDialogEvent()),
                            ),
                          ),
                        ],
                      ],
                    ));
          },
        ),
      ],
    );
  }
}

void _showOpeningClosingDialog(
  BuildContext context, {
  DateTime? datetime,
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
              backgroundColor: UIColors.background,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.35,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UIText.heading6('Open register shift'),
                    const Divider(color: UIColors.borderMuted),
                    const UIVerticalSpace(24),
                    if (datetime != null) ...[
                      Text(
                        'Closed since ${DateFormat('EEEE, d MMMM yyyy h:mm a').format(datetime.toLocal())}',
                        style: UIStyleText.bodyRegular.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      const UIVerticalSpace(30),
                    ],
                    UIText.labelMedium('Opening Amount'),
                    const UIVerticalSpace(8),
                    UITextFormField.noLabel(
                      hint: 'PHP 0',
                      width: 200,
                      controller: amountController,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Please enter the  initial register cash.';
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
                      onCancel: () => context.read<RegisterShiftBloc>().add(HideOpeningShiftDialogEvent()),
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
