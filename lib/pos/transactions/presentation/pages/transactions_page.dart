import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/transaction_detail_section.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_list/transaction_list.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransactionList(),
        UIHorizontalSpace(16),
        TransactionDetailSection(),
      ],
    );
  }
}
