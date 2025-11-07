// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_shift_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterShiftDetailDtoImpl _$$RegisterShiftDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterShiftDetailDtoImpl(
      status: json['status'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RegisterShiftDetailDtoImplToJson(
        _$RegisterShiftDetailDtoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
