part of 'pos_register_form_cubit.dart';

@freezed
class PosRegisterFormState with _$PosRegisterFormState {
  const factory PosRegisterFormState({
    int? id,
    String? name,
    Branch? assignedBranch,
  }) = _PosRegisterFormState;

  factory PosRegisterFormState.initial() => const PosRegisterFormState();

  factory PosRegisterFormState.fromRegister(PosRegister register) => PosRegisterFormState(
        id: register.id,
        name: register.name,
        assignedBranch: register.assignedBranch,
      );
}
