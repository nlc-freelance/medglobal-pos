part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.processing() = _Processing;
  const factory RegisterState.success(String message) = _Success;
  const factory RegisterState.deleted(String message) = _Deleted;
  const factory RegisterState.failure(String message) = _Failure;
}
