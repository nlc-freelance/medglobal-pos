part of 'counted_items_list_cubit.dart';

sealed class CountedItemsListState extends Equatable {
  const CountedItemsListState();

  @override
  List<Object?> get props => [];
}

final class StockTakeCountedItemsListInitial extends CountedItemsListState {}

final class StockTakeCountedItemsListLoading extends CountedItemsListState {}

final class StockTakeCountedItemsListLoaded extends CountedItemsListState {
  final StockTakeItemsPaginatedList data;
  final String? search;
  const StockTakeCountedItemsListLoaded({required this.data, this.search});

  @override
  List<Object?> get props => [data, search];
}

final class StockTakeCountedItemsListError extends CountedItemsListState {
  final String message;
  const StockTakeCountedItemsListError({required this.message});

  @override
  List<Object> get props => [message];
}
