part of 'product_list_cubit.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();

  @override
  List<Object> get props => [];
}

final class ProductListInitial extends ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListLoaded extends ProductListState {
  final ProductPaginatedList data;
  const ProductListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class ProductSearchNoResult extends ProductListState {
  final String message;
  const ProductSearchNoResult({required this.message});

  @override
  List<Object> get props => [message];
}

final class ProductListError extends ProductListState {
  final String message;
  const ProductListError({required this.message});

  @override
  List<Object> get props => [message];
}
