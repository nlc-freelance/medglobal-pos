part of 'stock_return_list_remote_cubit.dart';

sealed class StockReturnListRemoteState extends Equatable {
  const StockReturnListRemoteState();

  @override
  List<Object> get props => [];
}

final class StockReturnTransactionListInitial extends StockReturnListRemoteState {}

final class StockReturnTransactionListLoading extends StockReturnListRemoteState {}

final class StockReturnTransactionListLoaded extends StockReturnListRemoteState {
  final List<StockReturn> stockReturns;
  const StockReturnTransactionListLoaded({required this.stockReturns});

  @override
  List<Object> get props => [stockReturns];
}

final class StockReturnTransactionListError extends StockReturnListRemoteState {
  final String message;
  const StockReturnTransactionListError({required this.message});

  @override
  List<Object> get props => [message];
}
