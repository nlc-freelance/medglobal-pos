import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_blurred_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/print_receipt_cubit/print_receipt_cubit.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/sale_bloc/sale_bloc.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/cart/cart_open/cart_open.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/payment/widgets/charge_payment.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/screens/payment/widgets/payment_confirmed.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
      },
      child: BlocConsumer<SaleBloc, SaleState>(
        // return BlocConsumer<SaleRemoteCubit, SaleRemoteState>(
        // listener: (context, state) {
        //   if (state is SaleSuccess) {
        //     context.read<OrderCubit>().reset();
        //     context.read<TransactionListByBranchCubit>().addNewTransactionToList(state.transaction);
        //     context.read<ProductCatalogCubit>().getProductCatalog(isInitialSearch: true);
        //   }
        // },
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
                      // orElse: () =>
                      //  Column(
                      //   children: [
                      //     state.maybeWhen(
                      //         success: (transaction) => PaymentConfirmed(transaction: transaction),
                      //         failure: (message) => PageErrorBanner(message: message),
                      //         orElse: () => const ChargePayment()),
                      // state is SaleSuccess
                      //     ? PaymentConfirmed(transaction: state.transaction)
                      //     : const ChargePayment(),
                      // if (state is SaleError) ...[
                      //   const UIVerticalSpace(30),
                      //   Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Assets.icons.infoCircle.svg(),
                      //       const UIHorizontalSpace(8),
                      //       Flexible(child: UIText.labelSemiBold(state.message, color: UIColors.buttonDanger)),
                      //     ],
                      //   ),
                      // ],
                      // ],
                    ),
                  ),
                  // state is SaleLoading
                  //     ? const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2))
                  //     : Column(
                  //         children: [
                  //           state is SaleSuccess
                  //               ? PaymentConfirmed(transaction: state.transaction)
                  //               : const ChargePayment(),
                  //           if (state is SaleError) ...[
                  //             const UIVerticalSpace(30),
                  //             Row(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 Assets.icons.infoCircle.svg(),
                  //                 const UIHorizontalSpace(8),
                  //                 Flexible(child: UIText.labelSemiBold(state.message, color: UIColors.buttonDanger)),
                  //               ],
                  //             ),
                  //           ],
                  //         ],
                  //       ),
                  // ),
                  // ),
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
