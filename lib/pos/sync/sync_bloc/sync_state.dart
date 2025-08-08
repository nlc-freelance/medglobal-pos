part of 'sync_bloc.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.syncing() = _Syncing;
  const factory SyncState.synced() = _Synced;
  const factory SyncState.failure(String message) = _Failure;
}

// part of 'sync_bloc.dart';
//
// @freezed
// class SyncState with _$SyncState {
//   const factory SyncState.initial() = _Initial;
//   const factory SyncState.syncing() = _Syncing;
//   const factory SyncState.success() = _Success;
//   const factory SyncState.failure(String message) = _Failure;
// }
