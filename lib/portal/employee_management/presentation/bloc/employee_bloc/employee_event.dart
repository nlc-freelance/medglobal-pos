part of 'employee_bloc.dart';

@freezed
class EmployeeEvent with _$EmployeeEvent {
  const factory EmployeeEvent.getEmployee(int id) = _GetEmployee;
  const factory EmployeeEvent.createEmployee(Employee employee) = _CreateEmployee;
  const factory EmployeeEvent.updateEmployee(Employee employee) = _UpdateEmployee;
  const factory EmployeeEvent.deleteEmployee(Employee employee) = _DeleteEmployee;
}
