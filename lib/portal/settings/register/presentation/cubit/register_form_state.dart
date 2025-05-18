part of 'register_form_cubit.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    int? id,
    String? name,
    Branch? assignedBranch,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => const RegisterFormState();

  factory RegisterFormState.fromRegister(Register register) => RegisterFormState(
        id: register.id,
        name: register.name,
        assignedBranch: register.assignedBranch,
      );
}
