import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';

part 'employee_event.dart';
part 'employee_state.dart';
part 'employee_bloc.freezed.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _repository;

  EmployeeBloc(this._repository) : super(const EmployeeState.initial()) {
    on<_GetEmployee>(_onGetEmployee);
    on<_CreateEmployee>(_onCreateEmployee);
    on<_UpdateEmployee>(_onUpdateEmployee);
    on<_DeleteEmployee>(_onDeleteEmployee);
  }

  Future<void> _onGetEmployee(event, emit) async {
    emit(const EmployeeState.loading());
    try {
      final result = await _repository.getEmployee(event.id);

      result.fold(
        (failure) => emit(EmployeeState.loadFailed(failure.message)),
        (branch) => emit(EmployeeState.loaded(branch)),
      );
    } catch (e) {
      emit(EmployeeState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateEmployee(event, emit) async {
    emit(const EmployeeState.processing());
    try {
      final result = await _repository.createEmployee(event.employee);

      result.fold(
        (failure) => emit(EmployeeState.failure(failure.message)),
        (_) => emit(EmployeeState.success('${event.employee.name} successfully created.')),
      );
    } catch (e) {
      emit(EmployeeState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateEmployee(event, emit) async {
    emit(const EmployeeState.processing());
    try {
      final result = await _repository.updateEmployee(event.employee);

      result.fold(
        (failure) => emit(EmployeeState.failure(failure.message)),
        (_) => emit(EmployeeState.success('${event.employee.name} successfully updated.')),
      );
    } catch (e) {
      emit(EmployeeState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteEmployee(event, emit) async {
    emit(const EmployeeState.processing());
    try {
      final result = await _repository.deleteEmployee(event.employee.id);

      result.fold(
        (failure) => emit(EmployeeState.failure('Deletion failed. ${failure.message}')),
        (_) => emit(EmployeeState.success('${event.employee.name} successfully deleted.')),
      );
    } catch (e) {
      emit(EmployeeState.failure(e.toString()));
    }
  }
}
