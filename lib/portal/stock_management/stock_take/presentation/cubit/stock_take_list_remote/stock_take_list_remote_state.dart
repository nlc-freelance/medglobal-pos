part of 'stock_take_list_remote_cubit.dart';

sealed class StockTakeListRemoteState extends Equatable {
  const StockTakeListRemoteState();

  @override
  List<Object> get props => [];
}

final class StockTakeListInitial extends StockTakeListRemoteState {}

final class StockTakeListLoading extends StockTakeListRemoteState {}

final class StockTakeListLoaded extends StockTakeListRemoteState {
  final StockTakePaginatedList data;
  const StockTakeListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class StockTakeListError extends StockTakeListRemoteState {
  final String message;
  const StockTakeListError({required this.message});

  @override
  List<Object> get props => [message];
}
