part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.createRegister(Register register) = _CreateRegister;
  const factory RegisterEvent.updateRegister(int id, Register register) = _UpdateRegister;
  const factory RegisterEvent.deleteRegister(Register register) = _DeleteRegister;
  const factory RegisterEvent.reset() = _Reset;
}
