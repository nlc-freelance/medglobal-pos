part of 'read_sync_bloc.dart';

@freezed
class ReadSyncState with _$ReadSyncState {
  const factory ReadSyncState.initial() = _Initial;
  const factory ReadSyncState.syncing() = _Syncing;
  const factory ReadSyncState.synced({
    DateTime? lastSyncedAt,
    required DateTime now, // Forces a new state for the tick (5m ago, 10m ago etc)
  }) = _Synced;
  const factory ReadSyncState.failure({
    required String message,
    DateTime? lastSyncedAt,
    required DateTime now,
  }) = _Failure;
}

// part of 'sync_bloc.dart';
//
// @freezed
// class ReadSyncState with _$ReadSyncState {
//   const factory ReadSyncState.initial() = _Initial;
//   const factory ReadSyncState.syncing() = _Syncing;
//   const factory ReadSyncState.success() = _Success;
//   const factory ReadSyncState.failure(String message) = _Failure;
// }
