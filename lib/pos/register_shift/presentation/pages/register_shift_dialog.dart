import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_cubit/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_sync_bloc/product_catalog_sync_bloc.dart';
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
            open: (shift, error) {
              if (error == null) {
                Navigator.pop(context);
                // if really not needed remove the provider.value above as well
                // context.read<ProductCatalogSyncBloc>().add(const ProductCatalogSyncEvent.initialFetch());
                // context.read<ProductCatalogCubit>().getProductCatalog();
              }
            },
            orElse: () {},
          );
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
                  const UIVerticalSpace(16),
                  if (widget.dateTime != null) ...[
                    Text(
                      '${shiftAction.message} ${widget.dateTime!.toFullDateWithTimeFormat()}',
                      style: UIStyleText.bodyRegular.copyWith(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const UIVerticalSpace(24),
                  ],
                  UIText.bodyRegular('To proceed, please enter the ${shiftAction.inputLabel.toLowerCase()}'),
                  const UIVerticalSpace(8),
                  TextFormField(
                    focusNode: _focusNode,
                    controller: _amountCtrl,
                    inputFormatters: [NumberInputFormatter()],
                    decoration: InputDecoration(
                      hintText: 'PHP 0.00',
                      hintStyle: UIStyleText.bodyRegular.copyWith(color: UIColors.textMuted),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value?.trim().isEmpty == true) return shiftAction.validationText;
                      return null;
                    },
                  ),
                  const UIVerticalSpace(24),
                  state.maybeWhen(
                    open: (_, message) => message == null ? const SizedBox() : PageErrorBanner(message: message),
                    failure: (message) => PageErrorBanner(message: message),
                    orElse: () => const SizedBox(),
                  ),
                  const UIVerticalSpace(8),
                  CancelActionButton(
                    actionLabel: 'Continue',
                    isLoading: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    onCancel: () => Navigator.pop(context),
                    onAction: () {
                      if (_formKey.currentState?.validate() == true) {
                        _showAmountConfirmation(_amountCtrl.text, shiftAction.inputLabel);
                      }
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

  void _formatCurrency() {
    if (_amountCtrl.text.isEmpty) return;

    _amountCtrl.text = _amountCtrl.text.toCurrencyString();
  }

  void _showAmountConfirmation(String amount, String label) => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
            backgroundColor: UIColors.background,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                UIText.labelSemiBold('Confirm $label', align: TextAlign.center),
                const UIVerticalSpace(8),
                UIText.dataGridText(
                  'You are about to set the ${label.toLowerCase()}.\nAre you sure you want to proceed?',
                  align: TextAlign.center,
                  color: UIColors.textRegular,
                ),
                const UIVerticalSpace(16),
                UIText.subtitle(label),
                const UIVerticalSpace(2),
                UIText.heading4(amount.toCurrencyString()),
              ],
            ),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
              UIButton.filled(
                'Confirm',
                onClick: () {
                  widget.onConfirm(amount.toCurrencyNumber());
                  Navigator.pop(context);
                },
              ),
            ],
          ));

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
