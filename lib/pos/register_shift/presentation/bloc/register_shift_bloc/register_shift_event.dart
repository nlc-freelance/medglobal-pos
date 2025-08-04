part of 'register_shift_bloc.dart';

@freezed
class RegisterShiftEvent with _$RegisterShiftEvent {
  const factory RegisterShiftEvent.open(double amount) = _OpenShift;
  const factory RegisterShiftEvent.close(double amount) = _CloseShift;
}
