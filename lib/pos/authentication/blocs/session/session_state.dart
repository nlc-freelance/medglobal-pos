part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.active(User user) = _Active;
  const factory SessionState.inactive() = _Inactive;
  const factory SessionState.failure(String message) = _Failure;
}
