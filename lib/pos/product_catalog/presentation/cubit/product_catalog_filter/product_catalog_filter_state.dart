part of 'product_catalog_filter_cubit.dart';

@freezed
class ProductCatalogFilterState with _$ProductCatalogFilterState {
  const factory ProductCatalogFilterState({
    String? search,
  }) = _ProductCatalogFilterState;

  factory ProductCatalogFilterState.initial() => const ProductCatalogFilterState();
}
