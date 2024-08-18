part of 'branch_transaction_list_cubit.dart';

sealed class BranchTransactionListState extends Equatable {
  const BranchTransactionListState();

  @override
  List<Object> get props => [];
}

final class BranchTransactionListInitial extends BranchTransactionListState {}

final class BranchTransactionListLoading extends BranchTransactionListState {}

final class BranchTransactionListLoaded extends BranchTransactionListState {
  final List<Transaction> transactions;
  final bool hasReachedMax;
  const BranchTransactionListLoaded({required this.transactions, required this.hasReachedMax});

  @override
  List<Object> get props => [transactions, hasReachedMax];
}

final class BranchTransactionListError extends BranchTransactionListState {
  final String message;
  const BranchTransactionListError({required this.message});

  @override
  List<Object> get props => [message];
}
