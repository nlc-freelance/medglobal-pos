part of 'employee_bloc.dart';

@freezed
class EmployeeState with _$EmployeeState {
  const factory EmployeeState.initial() = _Initial;
  const factory EmployeeState.loading() = _Loading;
  const factory EmployeeState.loaded(Employee employee) = _Loaded;
  const factory EmployeeState.loadFailed(String message) = _LoadFailed;
  const factory EmployeeState.processing() = _Processing;
  const factory EmployeeState.success(String message) = _Success;
  const factory EmployeeState.failure(String message) = _Failure;
}
