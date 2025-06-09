import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/transaction_detail_section.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_list/transaction_list.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<RefundBloc>(),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TransactionList(),
          UIHorizontalSpace(16),
          TransactionDetailSection(),
        ],
      ),
    );
  }
}
