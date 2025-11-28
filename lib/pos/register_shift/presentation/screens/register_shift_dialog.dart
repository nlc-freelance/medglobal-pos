import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

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
  bool _showConfirmation = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _amountCtrl;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _amountCtrl = TextEditingController();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _formatCurrency();
      } else {
        if (_amountCtrl.text.isNotEmpty) {
          // If text is not empty, remove all comma so the text is back to just digits and 1 period
          // This is so the CurrencyInputFormatter still allows editing the same text
          _amountCtrl.text = _amountCtrl.text.removeCurrencyFormat();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final shiftAction = widget.action;

    return Form(
      key: _formKey,
      child: BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => PageLoader.show(context),
            open: (shift, error) {
              PageLoader.close();
              if (error == null) Navigator.of(context, rootNavigator: true).pop();
            },
            closed: (_) {
              PageLoader.close();
              Navigator.of(context, rootNavigator: true).pop();
            },
            failure: (_) => PageLoader.close(),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return Dialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            backgroundColor: UIColors.background,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
              child: _showConfirmation
                  ? Container(
                      key: const ValueKey(2),
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.money.svg(),
                          const UIVerticalSpace(16),
                          UIText.heading5('Confirm ${shiftAction.inputLabel}', align: TextAlign.center),
                          const UIVerticalSpace(16),
                          UIText.bodyRegular(
                            'You are about to set the ${shiftAction.inputLabel.toLowerCase()}.\nPlease confirm to proceed.',
                            align: TextAlign.center,
                            color: UIColors.textRegular,
                          ),
                          const UIVerticalSpace(16),
                          UIText.heading4('PHP ${_amountCtrl.text.toCurrencyString()}'),
                          const UIVerticalSpace(24),
                          state.maybeWhen(
                            open: (_, message) =>
                                message == null ? const SizedBox() : PageErrorBanner(message: message),
                            failure: (message) => PageErrorBanner(message: message),
                            orElse: () => const SizedBox(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UIButton.text(
                                'Edit amount',
                                onClick: () => setState(() => _showConfirmation = false),
                              ),
                              const UIHorizontalSpace(24),
                              UIButton.outlined(
                                'Confirm',
                                onClick: () {
                                  widget.onConfirm(_amountCtrl.text.toCurrencyNumber());
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(
                      key: const ValueKey(1),
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.money.svg(),
                          const UIVerticalSpace(16),
                          UIText.heading5(shiftAction.title, align: TextAlign.center),
                          const UIVerticalSpace(16),
                          if (widget.dateTime != null) ...[
                            UIText.bodyRegular(
                              ' ${shiftAction.message} ${widget.dateTime!.toFormattedFullDateTime12Hr()}.',
                              align: TextAlign.center,
                            ),
                            const UIVerticalSpace(2),
                          ],
                          UIText.bodyRegular(
                            'To proceed, please input the ${shiftAction.inputLabel.toLowerCase()}.',
                            align: TextAlign.center,
                          ),
                          const UIVerticalSpace(20),
                          SizedBox(
                            width: 230,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              focusNode: _focusNode,
                              controller: _amountCtrl,
                              inputFormatters: [NumberInputFormatter()],
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.borderRegular),
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: UIColors.textMuted),
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                hintText: 'PHP 0.00',
                                hintStyle: UIStyleText.bodyRegular.copyWith(color: UIColors.textMuted),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value?.trim().isEmpty == true) return shiftAction.validationText;
                                return null;
                              },
                            ),
                          ),
                          const UIVerticalSpace(24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UIButton.text('Cancel', onClick: () => Navigator.pop(context)),
                              const UIHorizontalSpace(24),
                              UIButton.outlined(
                                'Continue',
                                onClick: () {
                                  if (_formKey.currentState?.validate() == true) {
                                    setState(() => _showConfirmation = true);
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  void _formatCurrency() {
    if (_amountCtrl.text.isEmpty) return;

    _amountCtrl.text = _amountCtrl.text.toCurrencyString();
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

// TODO: Make a CurrencyFormField widget
extension CurrencyFormFieldX on String {
  String removeCurrencyFormat() => replaceAll(',', '');

  String toCurrencyString() {
    final cleaned = removeCurrencyFormat();
    return NumberFormat.currency(symbol: '').format(double.parse(cleaned));
  }

  double toCurrencyNumber() {
    final cleaned = removeCurrencyFormat();
    return double.parse(cleaned);
  }
}
