part of 'sync_bloc.dart';

@freezed
class SyncEvent with _$SyncEvent {
  const factory SyncEvent.start() = _Start;
  const factory SyncEvent.stop() = _Stop;
  const factory SyncEvent.manual() = _Manual;
}
