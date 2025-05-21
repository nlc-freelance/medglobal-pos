import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  Future<void> _onCreateRegister(event, emit) async {
    emit(const RegisterState.processing());
    try {
      final result = await _repository.createRegister(event.register);

      result.fold(
        (failure) => emit(RegisterState.failure(failure.message)),
        (register) => emit(RegisterState.success('${register.name} successfully created.')),
      );
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateRegister(event, emit) async {
    emit(const RegisterState.processing());
    try {
      final result = await _repository.updateRegister(event.register);

      result.fold(
        (failure) => emit(RegisterState.failure(failure.message)),
        (register) => emit(RegisterState.success('${register.name} successfully updated.')),
      );
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteRegister(event, emit) async {
    emit(const RegisterState.processing());
    try {
      final result = await _repository.deleteRegister(event.register.id);

      result.fold(
        (failure) => emit(RegisterState.failure(failure.message)),
        (_) => emit(RegisterState.deleted('${event.register.name} successfully deleted.')),
      );
    } catch (e) {
      emit(RegisterState.failure(e.toString()));
    }
  }

  void _onReset(_, emit) => emit(const RegisterState.initial());
}
