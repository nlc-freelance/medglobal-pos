part of 'uncounted_items_list_cubit.dart';

sealed class UncountedItemsListState extends Equatable {
  const UncountedItemsListState();

  @override
  List<Object?> get props => [];
}

final class StockTakeUncountedItemsListInitial extends UncountedItemsListState {}

final class StockTakeUncountedItemsListLoading extends UncountedItemsListState {}

final class StockTakeUncountedItemsListLoaded extends UncountedItemsListState {
  final StockTakeItemsPaginatedList data;
  final String? search;
  const StockTakeUncountedItemsListLoaded({required this.data, this.search});

  @override
  List<Object?> get props => [data, search];
}

final class StockTakeUncountedItemsListError extends UncountedItemsListState {
  final String message;
  const StockTakeUncountedItemsListError({required this.message});

  @override
  List<Object> get props => [message];
}
