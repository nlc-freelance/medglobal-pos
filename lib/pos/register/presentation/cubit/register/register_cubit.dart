import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register.dart';

part 'register_cubit.g.dart';
part 'register_state.dart';

class RegisterCubit extends HydratedCubit<RegisterState> {
  RegisterCubit() : super(const RegisterState(null, null));

  void setRegister(Register? register) async {
    if (register != null) await SharedPreferencesService.setRegisterBranchId(register.branch!.id!);
    emit(
      RegisterState(
        register,
        register != null ? null : 'Please select a register in order to proceed.',
      ),
    );
  }

  @override
  RegisterState? fromJson(Map<String, dynamic> json) => RegisterState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(RegisterState state) => state.toJson();

  Future<void> reset() async {
    emit(const RegisterState(null, null));
    await super.clear();
  }
}
