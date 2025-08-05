part of 'product_catalog_sync_bloc.dart';

@freezed
class ProductCatalogSyncState with _$ProductCatalogSyncState {
  const factory ProductCatalogSyncState.initial() = _Initial;
  const factory ProductCatalogSyncState.syncing() = _Syncing;
  const factory ProductCatalogSyncState.synced(DateTime lastSyncedAt) = _Synced;
  const factory ProductCatalogSyncState.failure(String message) = _Failure;
}
