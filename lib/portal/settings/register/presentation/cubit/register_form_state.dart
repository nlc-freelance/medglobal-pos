part of 'register_form_cubit.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    int? id,
    String? name,
    Branch? assignedBranch,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => const RegisterFormState();

  factory RegisterFormState.load(Register register) => RegisterFormState(
        id: register.id,
        name: register.name,
        assignedBranch: register.assignedBranch,
      );
}

extension RegisterFormStateExt on RegisterFormState {
  Register toRegister() {
    return Register(
      id: id,
      name: name!,
      assignedBranch: assignedBranch!,
    );
  }
}
