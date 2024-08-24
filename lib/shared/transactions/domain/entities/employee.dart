import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accessControls;

  const Employee({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.accessControls,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, email, accessControls];

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  String get name => '${firstName ?? ''} ${lastName ?? ''}';
}
