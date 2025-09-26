part of 'product_catalog_bloc.dart';

@freezed
class ProductCatalogEvent with _$ProductCatalogEvent {
  const factory ProductCatalogEvent.initialFetch() = _InitialFetchProductCatalog;
  const factory ProductCatalogEvent.deltaSync() = _DeltaSyncProductCatalog;
}
