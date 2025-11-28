part of 'access_validation_bloc.dart';

@freezed
class AccessValidationState with _$AccessValidationState {
  const factory AccessValidationState.initial() = _Initial;
  const factory AccessValidationState.loading() = _Loading;
  const factory AccessValidationState.granted(User user) = _Granted;
  const factory AccessValidationState.denied(String message) = _Denied;
  const factory AccessValidationState.failure(String message) = _Failure;
}
