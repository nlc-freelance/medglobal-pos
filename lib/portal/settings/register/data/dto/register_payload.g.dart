// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPayload _$RegisterPayloadFromJson(Map<String, dynamic> json) =>
    RegisterPayload(
      name: json['name'] as String?,
      storeId: json['storeId'] as int?,
      serialNumber: json['serialNumber'] as String?,
    );

Map<String, dynamic> _$RegisterPayloadToJson(RegisterPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'storeId': instance.storeId,
      'serialNumber': instance.serialNumber,
    };
