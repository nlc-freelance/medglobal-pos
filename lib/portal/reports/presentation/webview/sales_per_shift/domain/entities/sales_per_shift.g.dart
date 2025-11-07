// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_per_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPerShift _$SalesPerShiftFromJson(Map<String, dynamic> json) =>
    SalesPerShift(
      id: json['id'] as int?,
      openTime: _$JsonConverterFromJson<String, DateTime>(
          json['openTime'], const DateTimeConverter().fromJson),
      closeTime: _$JsonConverterFromJson<String, DateTime>(
          json['closeTime'], const DateTimeConverter().fromJson),
      branch: json['branch'] as String?,
      register: json['register'] as String?,
      totalSaleTransactions: json['totalSaleTransactions'] as int?,
      totalSalesAmount: (json['totalSalesAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalesPerShiftToJson(SalesPerShift instance) =>
    <String, dynamic>{
      'id': instance.id,
      'openTime': _$JsonConverterToJson<String, DateTime>(
          instance.openTime, const DateTimeConverter().toJson),
      'closeTime': _$JsonConverterToJson<String, DateTime>(
          instance.closeTime, const DateTimeConverter().toJson),
      'branch': instance.branch,
      'register': instance.register,
      'totalSaleTransactions': instance.totalSaleTransactions,
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
