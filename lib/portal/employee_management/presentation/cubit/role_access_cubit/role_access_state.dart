part of 'role_access_cubit.dart';

@freezed
class RoleAccessState with _$RoleAccessState {
  const factory RoleAccessState({
    EmployeeRole? role,
    @Default({}) Map<SystemAccess, bool> systemAccess,
    @Default([]) List<AccessControlModel> accessControls,
    @Default(true) bool isFormValid,
  }) = _RoleAccessState;

  const RoleAccessState._();

  factory RoleAccessState.initial() => const RoleAccessState();

  factory RoleAccessState.fromEmployee(Employee employee) => RoleAccessState(
        role: employee.role,
        systemAccess: {
          for (var defaultSystem in roleBasedSystemAccessMap[employee.role]!)
            defaultSystem: employee.systemAccess.contains(defaultSystem)
        },
        accessControls: employee.accessControls.map((access) => access.toAccessControlModel()).toList(),
      );

  static final roleBasedSystemAccessMap = {
    EmployeeRole.admin: [SystemAccess.portal],
    EmployeeRole.supervisor: [SystemAccess.pos, SystemAccess.portal],
    EmployeeRole.cashier: [SystemAccess.pos],
  };

  bool hasValidForm() =>
      role != null && systemAccess.entries.any((system) => system.value == true) && accessControls.isNotEmpty;
}
