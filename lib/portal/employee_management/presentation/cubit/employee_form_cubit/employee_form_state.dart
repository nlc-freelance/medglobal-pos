part of 'employee_form_cubit.dart';

@freezed
class EmployeeFormState with _$EmployeeFormState {
  const factory EmployeeFormState({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    @Default([]) List<Branch> assignedBranches,
  }) = _RoleAccessState;

  const EmployeeFormState._();

  factory EmployeeFormState.initial() => const EmployeeFormState();

  factory EmployeeFormState.fromEmployee(Employee employee) => EmployeeFormState(
        id: employee.id,
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        phone: employee.phone,
        assignedBranches: employee.assignedBranches,
      );

  String get name => '$firstName $lastName';
}
