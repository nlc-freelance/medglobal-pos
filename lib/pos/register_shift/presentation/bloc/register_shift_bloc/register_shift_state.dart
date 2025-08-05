part of 'register_shift_bloc.dart';

@freezed
class RegisterShiftState with _$RegisterShiftState {
  const factory RegisterShiftState.initial() = _Initial;
  const factory RegisterShiftState.loading() = _Loading;
  const factory RegisterShiftState.open(RegisterShift shift, {String? message}) = _Open;
  const factory RegisterShiftState.closed(DateTime? closedSince) = _Closed;
  const factory RegisterShiftState.failure(String message) = _Failure;
}
