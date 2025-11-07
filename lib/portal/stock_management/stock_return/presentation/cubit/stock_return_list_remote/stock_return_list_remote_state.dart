part of 'stock_return_list_remote_cubit.dart';

sealed class StockReturnListRemoteState extends Equatable {
  const StockReturnListRemoteState();

  @override
  List<Object> get props => [];
}

final class StockReturnListInitial extends StockReturnListRemoteState {}

final class StockReturnListLoading extends StockReturnListRemoteState {}

final class StockReturnListLoaded extends StockReturnListRemoteState {
  final StockReturnPaginatedList data;
  const StockReturnListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class StockReturnListError extends StockReturnListRemoteState {
  final String message;
  const StockReturnListError({required this.message});

  @override
  List<Object> get props => [message];
}
