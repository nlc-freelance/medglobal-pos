part of 'sync_bloc.dart';

@freezed
class SyncEvent with _$SyncEvent {
  const factory SyncEvent.start() = _StartPeriodicSync;
  const factory SyncEvent.syncNow({@Default(false) manual}) = _SyncNow;
  // const factory SyncEvent.syncReadData({@Default(false) manual}) = _SyncReadData;
  // const factory SyncEvent.syncWriteData({@Default(false) manual}) = _SyncWriteData;
  const factory SyncEvent.tick() = _Tick;
}

// part of 'sync_bloc.dart';
//
// @freezed
// class SyncEvent with _$SyncEvent {
//   const factory SyncEvent.start() = _Start;
//   const factory SyncEvent.stop() = _Stop;
//   const factory SyncEvent.manual() = _Manual;
// }
