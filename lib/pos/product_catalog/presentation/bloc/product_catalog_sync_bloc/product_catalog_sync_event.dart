part of 'product_catalog_sync_bloc.dart';

@freezed
class ProductCatalogSyncEvent with _$ProductCatalogSyncEvent {
  const factory ProductCatalogSyncEvent.initialFetch() = _InitialFetchProductCatalog;
  const factory ProductCatalogSyncEvent.deltaSync() = _DeltaSyncProductCatalog;
}
