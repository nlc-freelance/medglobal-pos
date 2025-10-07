import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _repository;

  RegisterBloc(this._repository) : super(const RegisterState.initial()) {
    on<_CreateRegister>(_onCreateRegister);
    on<_UpdateRegister>(_onUpdateRegister);
    on<_DeleteRegister>(_onDeleteRegister);
    on<_Reset>(_onReset);
  }

  Future<void> _onCreateRegister(_CreateRegister event, Emitter<RegisterState> emit) async {
    emit(const RegisterState.processing());
    try {
      final payload = RegisterPayload.fromRegister(event.register);
      final result = await _repository.createRegister(payload);

      result.when(
        success: (register) => emit(RegisterState.success('${register.name} successfully created.')),
        failure: (failure) => emit(RegisterState.failure(failure.message)),
      );
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateRegister(_UpdateRegister event, Emitter<RegisterState> emit) async {
    emit(const RegisterState.processing());
    try {
      final payload = RegisterPayload.fromRegister(event.register);
      final result = await _repository.updateRegister(event.id, payload);

      result.when(
        success: (register) => emit(RegisterState.success('${register.name} successfully updated.')),
        failure: (failure) => emit(RegisterState.failure(failure.message)),
      );
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteRegister(_DeleteRegister event, Emitter<RegisterState> emit) async {
    emit(const RegisterState.processing());
    try {
      final result = await _repository.deleteRegister(event.register.id!);

      result.when(
        success: (_) => emit(RegisterState.deleted('${event.register.name} successfully deleted.')),
        failure: (failure) => emit(RegisterState.failure(failure.message)),
      );
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  void _onReset(_, Emitter<RegisterState> emit) => emit(const RegisterState.initial());
}
