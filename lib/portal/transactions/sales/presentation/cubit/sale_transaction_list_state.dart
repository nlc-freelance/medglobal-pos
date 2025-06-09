part of 'sale_transaction_list_cubit.dart';

abstract class SaleTransactionListState extends Equatable {
  const SaleTransactionListState();
  @override
  List<Object> get props => [];
}

final class SaleTransactionListInitial extends SaleTransactionListState {}

final class SaleTransactionListLoading extends SaleTransactionListState {}

final class SaleTransactionListLoaded extends SaleTransactionListState {
  final PaginatedList<Transaction> data;
  const SaleTransactionListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class SaleTransactionSearchNoResult extends SaleTransactionListState {
  final String message;
  const SaleTransactionSearchNoResult({required this.message});

  @override
  List<Object> get props => [message];
}

final class SaleTransactionListError extends SaleTransactionListState {
  final String message;
  const SaleTransactionListError({required this.message});

  @override
  List<Object> get props => [message];
}
