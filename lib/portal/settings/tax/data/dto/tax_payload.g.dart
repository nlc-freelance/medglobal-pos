// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxPayload _$TaxPayloadFromJson(Map<String, dynamic> json) => TaxPayload(
      name: json['name'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$TaxPayloadToJson(TaxPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'percentage': instance.percentage,
      'isDefault': instance.isDefault,
    };
