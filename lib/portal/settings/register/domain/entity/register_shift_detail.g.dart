// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_shift_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterShiftDetail _$RegisterShiftDetailFromJson(Map<String, dynamic> json) =>
    RegisterShiftDetail(
      status: json['status'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
      updatedAt:
          const DateTimeConverter().fromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$RegisterShiftDetailToJson(
        RegisterShiftDetail instance) =>
    <String, dynamic>{
      'status': instance.status,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
