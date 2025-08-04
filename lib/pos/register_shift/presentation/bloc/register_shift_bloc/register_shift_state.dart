part of 'register_shift_bloc.dart';

@freezed
class RegisterShiftState with _$RegisterShiftState {
  const factory RegisterShiftState.initial() = _Initial;
  const factory RegisterShiftState.saving() = _Saving;
  const factory RegisterShiftState.success(RegisterShift shift) = _Success;
  const factory RegisterShiftState.failure(String message) = _Failure;
}
