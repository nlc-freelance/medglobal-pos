import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/pages/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/sale_bloc/sale_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ChargePayment extends StatefulWidget {
  const ChargePayment({super.key});

  @override
  State<ChargePayment> createState() => _ChargePaymentState();
}

class _ChargePaymentState extends State<ChargePayment> {
  late TextEditingController _amountReceivedController;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _amountReceivedController = TextEditingController();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        if (_amountReceivedController.text.isEmpty) return;

        _amountReceivedController.text = _amountReceivedController.text.toCurrencyString();
      } else {
        if (_amountReceivedController.text.isNotEmpty) {
          // If text is not empty, remove all comma so the text is back to just digits and 1 period
          // This is so the NumberInputFormatter still allows editing the same text
          _amountReceivedController.text = _amountReceivedController.text.removeCurrencyFormat();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final order = state.order;
        final quickBills = computePossibleAmounts(order.grandTotal());

        return SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  UIText.labelSemiBold('TOTAL AMOUNT DUE', color: UIColors.textMuted),
                  Text(
                    '₱ ${(order.grandTotal()).toPesoString()}',
                    style: UIStyleText.heading1.copyWith(fontSize: 58),
                  ),
                ],
              ),
              const UIVerticalSpace(40),
              Theme(
                data: Theme.of(context).copyWith(inputDecorationTheme: UIStyleInput.input.copyWith(isDense: false)),
                child: UITextField.topLabel(
                  cursorHeight: 24,
                  isAutoFocus: true,
                  style: UIStyleText.heading4,
                  label: 'CASH RECEIVED',
                  formatter: [CurrencyInputFormatter()],
                  controller: _amountReceivedController,
                ),
              ),
              const UIVerticalSpace(30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.labelRegular('QUICK CASH', color: UIColors.textLight),
                    const UIVerticalSpace(6),
                    Center(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _amountReceivedController.text = (order.grandTotal()).toPesoString();
                            },
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            hoverColor: UIColors.buttonSecondaryHover.withValues(alpha: 0.08),
                            highlightColor: UIColors.buttonSecondaryHover.withValues(alpha: 0.05),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                              decoration: BoxDecoration(
                                color: UIColors.buttonSecondaryHover.withValues(alpha: 0.08),
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                'EXACT',
                                style: UIStyleText.heading6.copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          ...quickBills.map((bill) => InkWell(
                                onTap: () {
                                  _amountReceivedController.text = bill.toStringAsFixed(2);
                                },
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                hoverColor: UIColors.buttonSecondaryHover.withValues(alpha: 0.08),
                                highlightColor: UIColors.buttonSecondaryHover.withValues(alpha: 0.05),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                                  decoration: BoxDecoration(
                                    color: UIColors.buttonSecondaryHover.withValues(alpha: 0.08),
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: UIText.label('₱ ${bill.toStringAsFixed(2)}'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const UIVerticalSpace(60),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: UIButton.filled(
                      'Back',
                      onClick: () => AppRouter.router.goNamed('registerScreen'),
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
                      'CHARGE',
                      onClick: () {
                        final amountPaid = _amountReceivedController.text.toDouble();
                        context.read<SaleBloc>().add(SaleEvent.createSale(order, amountPaid));
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

  @override
  void dispose() {
    _amountReceivedController.dispose();
    super.dispose();
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
