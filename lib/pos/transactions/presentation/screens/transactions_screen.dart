import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_view_mode/transaction_view_mode_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/widgets/transaction_details_view.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/widgets/transaction_list_view.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<RegisterTransactionBloc>()),
        BlocProvider(create: (_) => TransactionViewModeCubit()),
      ],
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: TransactionListView()),
          UIHorizontalSpace(16),
          Expanded(flex: 3, child: TransactionDetailsView()),
        ],
      ),
    );
  }
}
