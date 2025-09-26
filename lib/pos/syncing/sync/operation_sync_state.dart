part of 'operation_sync_bloc.dart';

@freezed
class OperationSyncState with _$OperationSyncState {
  const factory OperationSyncState.initial() = _Initial;
  const factory OperationSyncState.syncing() = _Syncing;
  const factory OperationSyncState.synced({
    DateTime? lastSyncedAt,
    required DateTime now, // Forces a new state for the tick (5m ago, 10m ago etc)
  }) = _Synced;
  const factory OperationSyncState.failure({
    required String message,
    DateTime? lastSyncedAt,
    required DateTime now,
  }) = _Failure;
}
