// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEmployeeDto _$CreateEmployeeDtoFromJson(Map<String, dynamic> json) =>
    CreateEmployeeDto(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      assignedStores: (json['assignedStores'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      role: json['role'] as String,
      systemAccess: (json['systemAccess'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      accessControls: (json['accessControls'] as List<dynamic>)
          .map((e) => AccessControlDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateEmployeeDtoToJson(CreateEmployeeDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'assignedStores': instance.assignedStores,
      'role': instance.role,
      'systemAccess': instance.systemAccess,
      'accessControls': instance.accessControls,
    };
