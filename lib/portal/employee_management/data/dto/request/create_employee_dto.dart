import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/access_control_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';

part 'create_employee_dto.g.dart';

@JsonSerializable()
class CreateEmployeeDto {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final List<int> assignedStores;
  final String role;
  final List<String> systemAccess;
  final List<AccessControlDto> accessControls;

  CreateEmployeeDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.assignedStores,
    required this.role,
    required this.systemAccess,
    required this.accessControls,
  });

  Map<String, dynamic> toJson() => _$CreateEmployeeDtoToJson(this);

  /// Mapping from domain entity
  factory CreateEmployeeDto.fromDomain(Employee employee) => CreateEmployeeDto(
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        phone: employee.phone,
        assignedStores: employee.assignedBranches.map((branch) => branch.id!).toList(),
        role: employee.role.name,
        systemAccess: employee.systemAccess.map((system) => system.label.toLowerCase()).toList(),
        accessControls: employee.accessControls
            .map((access) => AccessControlDto(
                  module: access.name,
                  features: access.features
                      .map((feature) => FeatureDto(
                          name: feature.name,
                          operations: feature.permissions
                              .map((permission) => PermissionDto(name: permission.type, value: permission.isChecked))
                              .toList()))
                      .toList(),
                ))
            .toList(),
      );
}
