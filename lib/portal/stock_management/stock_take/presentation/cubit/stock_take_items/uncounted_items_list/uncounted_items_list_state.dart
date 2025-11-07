part of 'uncounted_items_list_cubit.dart';

sealed class UncountedItemsListState extends Equatable {
  const UncountedItemsListState();

  @override
  List<Object?> get props => [];
}

final class UncountedItemsListInitial extends UncountedItemsListState {}

final class UncountedItemsListLoading extends UncountedItemsListState {}

final class UncountedItemsListLoaded extends UncountedItemsListState {
  final StockTakeItemsPaginatedList data;
  final String? search;
  const UncountedItemsListLoaded({required this.data, this.search});

  @override
  List<Object?> get props => [data, search];
}

final class UncountedItemsListError extends UncountedItemsListState {
  final String message;
  const UncountedItemsListError({required this.message});

  @override
  List<Object> get props => [message];
}
