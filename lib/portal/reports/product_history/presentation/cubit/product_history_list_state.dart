part of 'product_history_list_cubit.dart';

@immutable
abstract class ProductHistoryListState extends Equatable {
  const ProductHistoryListState();

  @override
  List<Object?> get props => [];
}

class ProductHistoryListInitial extends ProductHistoryListState {
  const ProductHistoryListInitial();

  @override
  List<Object?> get props => [];
}

class ProductHistoryListLoading extends ProductHistoryListState {
  const ProductHistoryListLoading();

  @override
  List<Object?> get props => [];
}

class ProductHistoryListLoaded extends ProductHistoryListState {
  final ProductHistoryPaginatedList data;
  const ProductHistoryListLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class ProductHistoryListError extends ProductHistoryListState {
  final String message;
  const ProductHistoryListError({required this.message});

  @override
  List<Object?> get props => [message];
}
