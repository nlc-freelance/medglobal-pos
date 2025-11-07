// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_control_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessControlDtoImpl _$$AccessControlDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AccessControlDtoImpl(
      module: json['module'] as String,
      features: (json['features'] as List<dynamic>)
          .map((e) => FeatureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AccessControlDtoImplToJson(
        _$AccessControlDtoImpl instance) =>
    <String, dynamic>{
      'module': instance.module,
      'features': instance.features,
    };

_$FeatureDtoImpl _$$FeatureDtoImplFromJson(Map<String, dynamic> json) =>
    _$FeatureDtoImpl(
      name: json['name'] as String,
      operations: (json['operations'] as List<dynamic>)
          .map((e) => PermissionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeatureDtoImplToJson(_$FeatureDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'operations': instance.operations,
    };

_$PermissionDtoImpl _$$PermissionDtoImplFromJson(Map<String, dynamic> json) =>
    _$PermissionDtoImpl(
      name: json['name'] as String,
      value: json['value'] as bool,
    );

Map<String, dynamic> _$$PermissionDtoImplToJson(_$PermissionDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
