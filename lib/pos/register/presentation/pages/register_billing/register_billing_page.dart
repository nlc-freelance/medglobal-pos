import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/sale_remote/sale_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/cart/cart_open.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/register_billing/widgets/charge_payment.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/pages/register_billing/widgets/payment_confirmed.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterBillingPage extends StatelessWidget {
  const RegisterBillingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const CartOpen(isOrderPlaced: true),
          ),
        ),
        const UIHorizontalSpace(16),
        Expanded(
          flex: 8,
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: SingleChildScrollView(
              child: BlocConsumer<SaleRemoteCubit, SaleRemoteState>(
                listener: (context, state) {
                  if (state is SaleSuccess) {
                    context.read<TransactionListByBranchCubit>().addNewTransactionToList(state.transaction);
                  }
                },
                builder: (context, state) {
                  if (state is SaleLoading) {
                    return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      state is SaleSuccess ? PaymentConfirmed(state.transaction) : const ChargePayment(),
                      const UIVerticalSpace(20),
                      if (state is SaleError) UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
