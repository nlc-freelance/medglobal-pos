// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_shift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterShiftDtoImpl _$$RegisterShiftDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterShiftDtoImpl(
      status: json['status'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RegisterShiftDtoImplToJson(
        _$RegisterShiftDtoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
