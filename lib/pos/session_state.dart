part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;
  const factory SessionState.loading() = _Loading;
  const factory SessionState.loaded(PosSession session) = _Loaded;
  const factory SessionState.failure(String message, String error, {Type? type}) = _Failure;
}
