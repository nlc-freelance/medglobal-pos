part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.check() = _CheckSession;
  const factory SessionEvent.start(User user) = _StartSession;
  const factory SessionEvent.end() = _EndSession;
}
