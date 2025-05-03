import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift.dart';
import 'package:medglobal_admin_portal/core/widgets/cancel_action_button.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterShiftDialog extends StatefulWidget {
  final void Function(double) onConfirm;
  final RegisterShiftAction action;
  final DateTime? dateTime;

  const RegisterShiftDialog({
    super.key,
    required this.onConfirm,
    required this.action,
    this.dateTime,
  });

  @override
  State<RegisterShiftDialog> createState() => _RegisterShiftDialogState();
}

class _RegisterShiftDialogState extends State<RegisterShiftDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _amountCtrl;

  @override
  void initState() {
    super.initState();
    _amountCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shiftAction = widget.action;

    return Form(
      key: _formKey,
      child: BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
        listener: (context, state) {
          if (state is RegisterShiftSuccess) {
            Navigator.pop(context);
            _amountCtrl.clear();

            context.read<RegisterCubit>().updateRegisterShift(state.shift);
            if (state.shift.status == 'open') context.read<POSProductListRemoteCubit>().getPOSProducts();
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
                  UIText.heading6(shiftAction.title),
                  const Divider(color: UIColors.borderMuted),
                  const UIVerticalSpace(24),
                  if (widget.dateTime != null) ...[
                    Text(
                      '${shiftAction.message} ${DateFormat('EEEE, d MMMM yyyy h:mm a').format(widget.dateTime!)}',
                      style: UIStyleText.bodyRegular.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const UIVerticalSpace(30),
                  ],
                  UITextFormField.vertical(
                    label: shiftAction.inputLabel,
                    hint: 'PHP 0',
                    isRequired: true,
                    formatter: [CurrencyInputFormatter()],
                    controller: _amountCtrl,
                    validation: shiftAction.validationText,
                  ),
                  const UIVerticalSpace(30),
                  if (state is RegisterShiftError) ...[
                    UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                    const UIVerticalSpace(30),
                  ],
                  CancelActionButton(
                    actionLabel: 'Confirm',
                    isLoading: state is RegisterShiftLoading,
                    onCancel: () => Navigator.pop(context),
                    onAction: () {
                      if (_formKey.currentState?.validate() == true) widget.onConfirm(double.parse(_amountCtrl.text));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
