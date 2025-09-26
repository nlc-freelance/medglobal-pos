import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/pos/device_setup/presentation/screens/settings_screen.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/cart/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/print_receipt/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/sale/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/cart/cart_open/cart_open.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/payment/widgets/charge_payment.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/screens/payment/widgets/payment_confirmed.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with DialogMixin {
  late CartBloc _cartBloc;
  bool _hasCompletedPayment = false;

  @override
  void initState() {
    super.initState();
    _cartBloc = context.read<CartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrintReceiptCubit, PrintReceiptState>(
      listener: (context, state) {
        if (state is PrintReceiptError) SnackbarUtil.error(context, state.message);
        if (state is PrinterNotSetup) {
          SnackbarUtil.info(
            context,
            'Your transaction went through, but there\'s no printer set up.',
            title: 'No Printer Detected',
            action: UIButton.text(
              'Open Settings',
              onClick: () => showCustomDialog(context, dialog: const SettingsDialog()),
            ),
          );
        }
      },
      child: BlocConsumer<SaleBloc, SaleState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (transaction) {
              setState(() => _hasCompletedPayment = true);
              context.read<PrintReceiptCubit>().generateAndPrintReceipt(transaction);
            },
            orElse: () => {},
          );
        },
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: UIColors.borderMuted, width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: CartOpen(
                    isCartEditable: false,
                    isOrderCompleted: _hasCompletedPayment,
                  ),
                ),
              ),
              const UIHorizontalSpace(16),
              Expanded(
                flex: 8,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(color: UIColors.borderMuted, width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          state.maybeWhen(
                            success: (transaction) => PaymentConfirmed(transaction: transaction),
                            processing: () =>
                                const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
                            orElse: () => const ChargePayment(),
                          ),
                          const UIVerticalSpace(36),
                          state.maybeWhen(
                            failure: (message) => PageErrorBanner(message: message),
                            orElse: () => const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_hasCompletedPayment) _cartBloc.add(const CartEvent.reset());
    super.dispose();
  }
}
