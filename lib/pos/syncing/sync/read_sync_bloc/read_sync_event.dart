part of 'read_sync_bloc.dart';

@freezed
class ReadSyncEvent with _$ReadSyncEvent {
  const factory ReadSyncEvent.start() = _StartPeriodicSync;
  const factory ReadSyncEvent.syncNow({@Default(false) manual}) = _SyncNow;
  const factory ReadSyncEvent.tick() = _Tick;
}
