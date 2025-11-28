import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_view_mode/transaction_view_mode_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/issue_refund/issue_refund_view.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/refund/refund_transaction_view.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/sale/sale_transaction_view.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/widgets/transaction_placeholder_view.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      decoration: BoxDecoration(
        border: Border.all(color: UIColors.borderMuted, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: BlocConsumer<RegisterTransactionBloc, RegisterTransactionState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (transaction) {
              if (transaction.type == TransactionType.sale) {
                context.read<TransactionViewModeCubit>().view(TransactionViewMode.sale);
              }
              if (transaction.type == TransactionType.refund) {
                context.read<TransactionViewModeCubit>().view(TransactionViewMode.refund);
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const TransactionPlaceholderView(),
            loading: () => const LoadingView(),
            loaded: (transaction) => SingleChildScrollView(
              child: BlocBuilder<TransactionViewModeCubit, TransactionViewMode>(
                builder: (context, mode) {
                  return switch (mode) {
                    TransactionViewMode.sale => SaleTransactionView(transaction: transaction),
                    TransactionViewMode.refund => RefundTransactionView(transaction: transaction),
                    TransactionViewMode.issueRefund => IssueRefundView(transaction: transaction),
                  };
                },
              ),
            ),
            failure: (message) => FailureView(message),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
