import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  static String route = '/point-of-sale/transactions';

  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Transactions'),
      ],
    );
  }
}
