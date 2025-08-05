part of 'product_catalog_cubit.dart';

sealed class ProductCatalogState extends Equatable {
  const ProductCatalogState();

  @override
  List<Object> get props => [];
}

final class ProductCatalogInitial extends ProductCatalogState {}

final class ProductCatalogLoading extends ProductCatalogState {}

final class ProductCatalogLoaded extends ProductCatalogState {
  final List<CatalogItem> products;
  final bool hasReachedMax;
  const ProductCatalogLoaded({required this.products, required this.hasReachedMax});

  @override
  List<Object> get props => [products, hasReachedMax];
}

final class ProductCatalogFailure extends ProductCatalogState {
  final String message;
  const ProductCatalogFailure({required this.message});

  @override
  List<Object> get props => [message];
}
