// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaxDtoImpl _$$TaxDtoImplFromJson(Map<String, dynamic> json) => _$TaxDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      percentage: (json['percentage'] as num).toDouble(),
      isDefault: json['isDefault'] as bool? ?? false,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$TaxDtoImplToJson(_$TaxDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percentage': instance.percentage,
      'isDefault': instance.isDefault,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
