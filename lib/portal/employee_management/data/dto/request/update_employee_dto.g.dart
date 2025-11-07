// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmployeeDto _$UpdateEmployeeDtoFromJson(Map<String, dynamic> json) =>
    UpdateEmployeeDto(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      assignedStores: (json['assignedStores'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      role: json['role'] as String?,
      systemAccess: (json['systemAccess'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accessControls: (json['accessControls'] as List<dynamic>?)
          ?.map((e) => AccessControlDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateEmployeeDtoToJson(UpdateEmployeeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'assignedStores': instance.assignedStores,
      'role': instance.role,
      'systemAccess': instance.systemAccess,
      'accessControls': instance.accessControls,
    };
