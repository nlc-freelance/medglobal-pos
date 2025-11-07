// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterShiftImpl _$$RegisterShiftImplFromJson(Map<String, dynamic> json) =>
    _$RegisterShiftImpl(
      id: json['id'] as int?,
      status: json['status'] as String? ?? 'open',
      openingAmount: (json['openingAmount'] as num?)?.toDouble(),
      closingAmount: (json['closingAmount'] as num?)?.toDouble(),
      openedAt: json['openedAt'] == null
          ? null
          : DateTime.parse(json['openedAt'] as String),
      closedAt: json['closedAt'] == null
          ? null
          : DateTime.parse(json['closedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as int,
      registerId: json['registerId'] as int,
    );

Map<String, dynamic> _$$RegisterShiftImplToJson(_$RegisterShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'openingAmount': instance.openingAmount,
      'closingAmount': instance.closingAmount,
      'openedAt': instance.openedAt?.toIso8601String(),
      'closedAt': instance.closedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'userId': instance.userId,
      'registerId': instance.registerId,
    };
