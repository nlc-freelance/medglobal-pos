import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';

part 'employee_dto.g.dart';

@JsonSerializable()
class EmployeeDto extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accessControls;

  const EmployeeDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accessControls,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email, accessControls];

  factory EmployeeDto.fromJson(Map<String, dynamic> json) => _$EmployeeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeDtoToJson(this);

  Employee toEntity() => Employee(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        accessControls: accessControls,
      );

  factory EmployeeDto.fromDomain(Employee employee) => EmployeeDto(
        id: employee.id,
        firstName: employee.firstName,
        lastName: employee.lastName,
        email: employee.email,
        accessControls: employee.accessControls,
      );
}
