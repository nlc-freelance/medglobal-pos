part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.submitting() = _Loading;
  const factory RegisterState.success(String message) = _Success;
  const factory RegisterState.failure(String message) = _Failure;
}
