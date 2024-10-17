part of 'counted_items_list_cubit.dart';

sealed class CountedItemsListState extends Equatable {
  const CountedItemsListState();

  @override
  List<Object?> get props => [];
}

final class CountedItemsListInitial extends CountedItemsListState {}

final class CountedItemsListLoading extends CountedItemsListState {}

final class CountedItemsListLoaded extends CountedItemsListState {
  final StockTakeItemsPaginatedList data;
  final String? search;
  const CountedItemsListLoaded({required this.data, this.search});

  @override
  List<Object?> get props => [data, search];
}

final class CountedItemsListError extends CountedItemsListState {
  final String message;
  const CountedItemsListError({required this.message});

  @override
  List<Object> get props => [message];
}
