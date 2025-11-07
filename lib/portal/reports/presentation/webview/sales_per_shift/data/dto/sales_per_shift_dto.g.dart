// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_per_shift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPerShiftDto _$SalesPerShiftDtoFromJson(Map<String, dynamic> json) =>
    SalesPerShiftDto(
      id: json['id'] as int?,
      openTime: _$JsonConverterFromJson<String, DateTime>(
          json['openShift'], const DateTimeConverter().fromJson),
      closeTime: _$JsonConverterFromJson<String, DateTime>(
          json['closeShift'], const DateTimeConverter().fromJson),
      branch: json['branch'] as String?,
      register: json['register'] as String?,
      totalSaleTransactions: json['totalSales'] as int?,
      totalSalesAmount: (json['totalSalesAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalesPerShiftDtoToJson(SalesPerShiftDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'openShift': _$JsonConverterToJson<String, DateTime>(
          instance.openTime, const DateTimeConverter().toJson),
      'closeShift': _$JsonConverterToJson<String, DateTime>(
          instance.closeTime, const DateTimeConverter().toJson),
      'branch': instance.branch,
      'register': instance.register,
      'totalSales': instance.totalSaleTransactions,
      'totalSalesAmount': instance.totalSalesAmount,
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
