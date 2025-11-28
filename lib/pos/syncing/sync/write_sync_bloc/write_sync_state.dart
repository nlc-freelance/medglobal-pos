part of 'write_sync_bloc.dart';

@freezed
class WriteSyncState with _$WriteSyncState {
  const factory WriteSyncState.initial() = _Initial;
  const factory WriteSyncState.syncing() = _Syncing;
  const factory WriteSyncState.synced({
    DateTime? lastSyncedAt,
    required DateTime now, // Forces a new state for the tick (5m ago, 10m ago etc)
  }) = _Synced;
  const factory WriteSyncState.failure({
    required String message,
    DateTime? lastSyncedAt,
    required DateTime now,
  }) = _Failure;
}
