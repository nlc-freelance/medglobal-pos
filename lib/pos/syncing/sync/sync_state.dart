part of 'sync_bloc.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState.initial() = _Initial;
  const factory SyncState.syncing() = _Syncing;
  const factory SyncState.synced({
    DateTime? lastSyncedAt,
    required DateTime now, // Forces a new state for the tick (5m ago, 10m ago etc)
  }) = _Synced;
  const factory SyncState.failure({
    required String message,
    DateTime? lastSyncedAt,
    required DateTime now,
  }) = _Failure;
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
