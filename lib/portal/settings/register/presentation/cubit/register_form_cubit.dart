import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

part 'register_form_state.dart';
part 'register_form_cubit.freezed.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  RegisterFormCubit() : super(RegisterFormState.initial());

  void initRegister(Register register) => emit(RegisterFormState.fromRegister(register));

  void setName(String name) => emit(state.copyWith(name: name));

  void setAssignedBranch(Branch branch) => emit(state.copyWith(assignedBranch: branch));

  /// After form is validated, map TaxFormState values to a Tax
  Register toRegister() {
    return Register(
      id: state.id,
      name: state.name!,
      assignedBranch: state.assignedBranch!,
    );
  }

  void reset() => emit(RegisterFormState.initial());
}
