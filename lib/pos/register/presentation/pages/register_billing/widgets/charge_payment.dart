import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ChargePayment extends StatefulWidget {
  const ChargePayment({super.key});

  @override
  State<ChargePayment> createState() => _ChargePaymentState();
}

class _ChargePaymentState extends State<ChargePayment> {
  late TextEditingController _amountReceivedController;
  double _change = 0;

  @override
  void initState() {
    super.initState();
    _amountReceivedController = TextEditingController();
  }

  @override
  void dispose() {
    _amountReceivedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerId = context.read<RegisterCubit>().state.register!.id;

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final order = state.order;
        final quickBills = computePossibleAmounts(order.total ?? 0);

        return SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.money.svg(width: 80, colorFilter: UIColors.textRegular.toColorFilter),
              const UIVerticalSpace(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UIText.heading6('TOTAL', color: UIColors.textMuted),
                  UIText.headline('₱${(order.total ?? 0).toStringAsFixed(2)}'),
                ],
              ),
              if (_amountReceivedController.text.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIText.heading6('RECEIVED', color: UIColors.textMuted),
                    UIText.heading1('₱${(double.tryParse(_amountReceivedController.text) ?? 0).toStringAsFixed(2)}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIText.heading6('CHANGE', color: UIColors.textMuted),
                    Text(
                      '₱${_change.toStringAsFixed(2)}',
                      style: UIStyleText.heading1.copyWith(color: UIColors.warning, fontSize: 36),
                    ),
                  ],
                ),
              ],
              const UIVerticalSpace(60),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Theme(
                      data:
                          Theme.of(context).copyWith(inputDecorationTheme: UIStyleInput.input.copyWith(isDense: false)),
                      child: UITextField.topLabel(
                        cursorHeight: 30,
                        isAutoFocus: true,
                        style: UIStyleText.heading4,
                        label: 'Cash received',
                        formatter: [CurrencyInputFormatter()],
                        controller: _amountReceivedController,
                        onChanged: (value) {
                          final amountReceived = double.tryParse(value.replaceAll(',', ''));
                          setState(() => _change = amountReceived == null ? 0 : amountReceived - (order.total ?? 0));
                        },
                      ),
                    ),
                  ),
                  const UIHorizontalSpace(8),
                  InkWell(
                    onTap: () {
                      _amountReceivedController.text = (order.total ?? 0).toStringAsFixed(2);
                      setState(() => _change = 0);
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    hoverColor: UIColors.buttonSecondaryHover,
                    highlightColor: UIColors.buttonSecondaryHover,
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: UIColors.borderRegular),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(child: UIText.heading6('Exact')),
                    ),
                  )
                ],
              ),
              const UIVerticalSpace(30),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const UIHorizontalSpace(8),
                  itemCount: quickBills.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      _amountReceivedController.text = quickBills[index].toStringAsFixed(2);
                      setState(
                          () => _change = (double.tryParse(_amountReceivedController.text) ?? 0) - (order.total ?? 0));
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    hoverColor: UIColors.buttonSecondaryHover,
                    highlightColor: UIColors.buttonSecondaryHover,
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: UIColors.borderRegular),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(child: UIText.heading6(quickBills[index].toStringAsFixed(2))),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(60),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: UIButton.filled(
                      'Go back',
                      onClick: () => AppRouter.router.goNamed('Register'),
                      style: UIStyleButton.filled.style?.copyWith(
                        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                        backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
                        overlayColor: UIStyleUtil.setColor(UIColors.borderMuted),
                        textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6),
                        foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.textRegular),
                      ),
                    ),
                  ),
                  const UIHorizontalSpace(16),
                  Expanded(
                    child: UIButton.filled(
                      'Charge',
                      onClick: () {
                        context.read<SaleRemoteCubit>().createSale(
                              registerId: registerId!,
                              order: order,
                              receivedAmount: double.tryParse(_amountReceivedController.text),
                            );
                      },
                      style: UIStyleButton.filled.style?.copyWith(
                        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
                        textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6.copyWith(color: UIColors.textRegular)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

List<int> computePossibleAmounts(double totalAmount) {
  List<int> denominations = [10, 20, 50, 100];

  Set<int> suggestedAmounts = {};

  int roundedAmount = totalAmount.ceil();
  if (roundedAmount != totalAmount) suggestedAmounts.add(roundedAmount);

  for (int denomination in denominations) {
    int nextMultipleOfDenomination = ((roundedAmount ~/ denomination) + 1) * denomination;
    if (suggestedAmounts.length >= 4) break;
    if (nextMultipleOfDenomination > totalAmount) {
      suggestedAmounts.add(nextMultipleOfDenomination);
    }
  }

  return suggestedAmounts.toList()..sort();
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Regular expression to match only digits, commas, and periods
    final regex = RegExp(r'^[\d,.]*$');

    // If the new value matches the regex, allow it; otherwise, reject it
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    }

    // If the new value does not match, return the old value to reject the input
    return oldValue;
  }
}
