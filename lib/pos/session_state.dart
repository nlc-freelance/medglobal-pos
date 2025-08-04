part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.success() = _Success;
  const factory SessionState.failure(String error, String message, {Type? type}) = _Failure;
}
