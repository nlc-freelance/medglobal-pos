import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/access_control_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/system_access_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';

part 'employee_dto.freezed.dart';
part 'employee_dto.g.dart';

@freezed
class EmployeeDto with _$EmployeeDto {
  const factory EmployeeDto({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required List<BranchDto> assignedStores,
    required String role,
    required List<String> systemAccess,
    required List<AccessControlDto> accessControls,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _EmployeeDto;

  const EmployeeDto._();

  factory EmployeeDto.fromJson(Map<String, dynamic> json) => _$EmployeeDtoFromJson(json);

  Employee toDomain() => Employee(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        assignedBranches: assignedStores.map((store) => BranchMapper.fromDto(store)).toList(),
        role: EmployeeRole.fromString(role),
        systemAccess: systemAccess.map((system) => SystemAccess.fromString(system)).toList(),
        accessControls: accessControls.map((access) => access.toDomain()).toList(),
      );
}
