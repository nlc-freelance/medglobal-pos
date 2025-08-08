part of 'app_session_bloc.dart';

@freezed
class AppSessionState with _$AppSessionState {
  const factory AppSessionState.initial() = _Initial;
  const factory AppSessionState.loading() = _Loading;
  const factory AppSessionState.loaded(AppSession session) = _Loaded;
  const factory AppSessionState.failure(String message, String error, {Type? type}) = _Failure;
}
