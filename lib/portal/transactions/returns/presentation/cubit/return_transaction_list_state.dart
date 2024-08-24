part of 'return_transaction_list_cubit.dart';

abstract class ReturnTransactionListState extends Equatable {
  const ReturnTransactionListState();
  @override
  List<Object> get props => [];
}

final class ReturnTransactionListInitial extends ReturnTransactionListState {}

final class ReturnTransactionListLoading extends ReturnTransactionListState {}

final class ReturnTransactionListLoaded extends ReturnTransactionListState {
  final TransactionPaginatedList data;
  const ReturnTransactionListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class ReturnTransactionListError extends ReturnTransactionListState {
  final String message;
  const ReturnTransactionListError({required this.message});

  @override
  List<Object> get props => [message];
}
