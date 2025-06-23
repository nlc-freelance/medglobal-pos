import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/access_control_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';

part 'update_employee_dto.g.dart';

@JsonSerializable()
class UpdateEmployeeDto {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final List<int>? assignedStores;
  final String? role;
  final List<String>? systemAccess;
  final List<AccessControlDto>? accessControls;

  UpdateEmployeeDto({
    required this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.assignedStores,
    this.role,
    this.systemAccess,
    this.accessControls,
  });

  Map<String, dynamic> toJson() => _$UpdateEmployeeDtoToJson(this);

  /// Mapping from domain entity
  factory UpdateEmployeeDto.fromDomain(Employee employee) => UpdateEmployeeDto(
        id: employee.id!,
        firstName: employee.firstName,
        lastName: employee.lastName,
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
