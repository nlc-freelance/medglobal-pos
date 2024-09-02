import 'package:flutter/material.dart';
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
          width: MediaQuery.sizeOf(context).width * 0.40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: UIColors.textRegular.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Assets.icons.money.svg(width: 30, colorFilter: UIColors.textLight.toColorFilter),
              ),
              const UIVerticalSpace(30),
              Column(
                children: [
                  UIText.labelSemiBold('TOTAL DUE', color: UIColors.textGray),
                  Text(
                    '₱ ${(order.total ?? 0).toPesoString()}',
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
                  onChanged: (value) {
                    final amountReceived = double.tryParse(value.replaceAll(',', ''));
                    setState(() => _change = amountReceived == null ? 0 : amountReceived - (order.total ?? 0));
                  },
                ),
              ),
              const UIVerticalSpace(30),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.labelRegular('QUICK CASH', color: UIColors.textLight),
                    const UIVerticalSpace(4.0),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        InkWell(
                          onTap: () {
                            _amountReceivedController.text = (order.total ?? 0).toPesoString();
                            setState(() => _change = 0);
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          hoverColor: UIColors.buttonSecondaryHover.withOpacity(0.08),
                          highlightColor: UIColors.buttonSecondaryHover.withOpacity(0.05),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                            decoration: BoxDecoration(
                              color: UIColors.buttonSecondaryHover.withOpacity(0.05),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Text(
                              'EXACT',
                              style: UIStyleText.heading6.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        ...quickBills.map((bill) => InkWell(
                              onTap: () {
                                _amountReceivedController.text = bill.toStringAsFixed(2);
                                setState(() => _change =
                                    (double.tryParse(_amountReceivedController.text) ?? 0) - (order.total ?? 0));
                              },
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              hoverColor: UIColors.buttonSecondaryHover.withOpacity(0.08),
                              highlightColor: UIColors.buttonSecondaryHover.withOpacity(0.05),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: UIColors.buttonSecondaryHover.withOpacity(0.05),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: UIText.label('₱ ${bill.toStringAsFixed(2)}'),
                              ),
                            )),
                      ],
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
                    flex: 4,
                    child: UIButton.filled(
                      'CHARGE',
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
