import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/domain/pos_register.dart';

part 'pos_register_form_state.dart';
part 'pos_register_form_cubit.freezed.dart';

class PosRegisterFormCubit extends Cubit<PosRegisterFormState> {
  PosRegisterFormCubit() : super(PosRegisterFormState.initial());

  void initPosRegister(PosRegister tax) => emit(PosRegisterFormState.fromRegister(tax));

  void setName(String value) => emit(state.copyWith(name: value));

  void setAssignedBranch(Branch value) => emit(state.copyWith(assignedBranch: value));

  void reset() => emit(PosRegisterFormState.initial());
}
