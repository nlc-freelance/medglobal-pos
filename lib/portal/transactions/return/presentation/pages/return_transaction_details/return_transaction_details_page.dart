import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/transactions/bloc/transaction_bloc.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/pages/return_transaction_details/return_transaction_details.dart';
// import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReturnTransactionDetailsPage extends StatefulWidget {
  const ReturnTransactionDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<ReturnTransactionDetailsPage> createState() => _ReturnTransactionDetailsPageState();
}

class _ReturnTransactionDetailsPageState extends State<ReturnTransactionDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(TransactionEvent.getTransactionById(int.parse(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) => state.maybeWhen(
        loaded: (transaction) => context.read<ReturnCubit>().setReturnItems(transaction, transaction.items ?? []),
        orElse: () => {},
      ),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Return Details'),
            const UIVerticalSpace(20),
            state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: UIColors.primary,
                  strokeWidth: 2,
                ),
              ),
              loaded: (transaction) => ReturnTransactionDetails(transaction: transaction),
              failure: (message) => FailureView(message),
              orElse: () => const SizedBox(),
            ),
            // if (state is TransactionByIdLoading) ...[
            //   const UIVerticalSpace(30.0),
            //   const Center(
            //     child: CircularProgressIndicator(
            //       color: UIColors.primary,
            //       strokeWidth: 2,
            //     ),
            //   ),
            // ],
            // if (state is TransactionByIdError) Text(state.message),
            // if (state is TransactionByIdSuccess) ReturnTransactionDetails(transaction: state.transaction),
          ],
        );
      },
    );
  }
}
