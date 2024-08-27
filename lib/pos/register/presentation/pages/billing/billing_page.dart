import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/billing/widgets/charge_payment.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/billing/widgets/order_summary.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/billing/widgets/payment_confirmed.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaleRemoteCubit, SaleRemoteState>(
      listener: (context, state) {
        if (state is SaleSuccess) {
          context.read<OrderCubit>().reset();
          context.read<TransactionListByBranchCubit>().addNewTransactionToList(state.transaction);
          context.read<RegisterItemListRemoteCubit>().getRegisterItems(isInitialSearch: true);
        }
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
                child: state is SaleSuccess ? OrderSummary(state.transaction) : const CartOpen(isReadOnly: true),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                  border: Border.all(color: UIColors.borderMuted, width: 1.0),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: state is SaleLoading
                        ? const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2))
                        : Column(
                            children: [
                              state is SaleSuccess
                                  ? PaymentConfirmed(transaction: state.transaction)
                                  : const ChargePayment(),
                              const UIVerticalSpace(20),
                              if (state is SaleError)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Assets.icons.infoCircle.svg(),
                                    const UIHorizontalSpace(8),
                                    Expanded(
                                      child: UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                                    ),
                                  ],
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
    );
  }
}
