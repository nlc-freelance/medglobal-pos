import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/employee.dart';

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
}
