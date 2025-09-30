part of 'write_sync_bloc.dart';

@freezed
class WriteSyncEvent with _$WriteSyncEvent {
  const factory WriteSyncEvent.start() = _StartPeriodicSync;
  const factory WriteSyncEvent.syncNow({@Default(false) manual}) = _SyncNow;
  const factory WriteSyncEvent.tick() = _Tick;
}
