part of 'operation_sync_bloc.dart';

@freezed
class OperationSyncEvent with _$OperationSyncEvent {
  const factory OperationSyncEvent.start() = _StartPeriodicSync;
  const factory OperationSyncEvent.syncNow({@Default(false) manual}) = _SyncNow;
  const factory OperationSyncEvent.tick() = _Tick;
}
