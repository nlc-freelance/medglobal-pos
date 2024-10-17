import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_details/return_transaction_details.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
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
    context.read<TransactionCubit>().getTransactionById(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is TransactionByIdSuccess) context.read<ReturnCubit>().setReturn(state.transaction);
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Return Details'),
            const UIVerticalSpace(20),
            if (state is TransactionByIdLoading) ...[
              const UIVerticalSpace(30.0),
              const Center(
                child: CircularProgressIndicator(
                  color: UIColors.primary,
                  strokeWidth: 2,
                ),
              ),
            ],
            if (state is TransactionByIdError) Text(state.message),
            if (state is TransactionByIdSuccess) const ReturnTransactionDetails(),
          ],
        );
      },
    );
  }
}
