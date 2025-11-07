part of 'product_catalog_cubit.dart';

sealed class ProductCatalogLocalState extends Equatable {
  const ProductCatalogLocalState();

  @override
  List<Object> get props => [];
}

final class ProductCatalogInitial extends ProductCatalogLocalState {}

final class ProductCatalogLoading extends ProductCatalogLocalState {}

final class ProductCatalogLoaded extends ProductCatalogLocalState {
  final List<CatalogItem> products;
  final bool hasReachedMax;
  const ProductCatalogLoaded({required this.products, required this.hasReachedMax});

  @override
  List<Object> get props => [products, hasReachedMax];
}

final class ProductCatalogFailure extends ProductCatalogLocalState {
  final String message;
  const ProductCatalogFailure({required this.message});

  @override
  List<Object> get props => [message];
}
