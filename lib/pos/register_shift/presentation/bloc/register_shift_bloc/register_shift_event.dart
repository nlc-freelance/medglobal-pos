part of 'register_shift_bloc.dart';

@freezed
class RegisterShiftEvent with _$RegisterShiftEvent {
  const factory RegisterShiftEvent.checkForOpen() = _CheckForOpenShift;
  const factory RegisterShiftEvent.getLastClosed() = _GetLastClosedShift;
  const factory RegisterShiftEvent.open(double amount) = _OpenShift;
  const factory RegisterShiftEvent.close(int shiftId, double amount) = _CloseShift;
}
