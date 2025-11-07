// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_per_shift_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPerShiftDetails _$SalesPerShiftDetailsFromJson(
        Map<String, dynamic> json) =>
    SalesPerShiftDetails(
      openTime: _$JsonConverterFromJson<String, DateTime>(
          json['openTime'], const DateTimeConverter().fromJson),
      closeTime: _$JsonConverterFromJson<String, DateTime>(
          json['closeTime'], const DateTimeConverter().fromJson),
      branch: json['branch'] as String?,
      register: json['register'] as int?,
      openedBy: json['openedBy'] as String?,
      closedBy: json['closedBy'] as String?,
      totalSaleTransactions: json['totalSaleTransactions'] as int?,
      totalReturnTransactions: json['totalReturnTransactions'] as int?,
      totalDiscountedTransactions: json['totalDiscountedTransactions'] as int?,
      totalGrossSalesAmount:
          (json['totalGrossSalesAmount'] as num?)?.toDouble(),
      totalSalesAmount: (json['totalSalesAmount'] as num?)?.toDouble(),
      totalReturnsAmount: (json['totalReturnsAmount'] as num?)?.toDouble(),
      totalDiscountedAmount:
          (json['totalDiscountedAmount'] as num?)?.toDouble(),
      netSales: (json['netSales'] as num?)?.toDouble(),
      netSalesCash: (json['netSalesCash'] as num?)?.toDouble(),
      openingCash: (json['openingCash'] as num?)?.toDouble(),
      closingCash: (json['closingCash'] as num?)?.toDouble(),
      actualCash: (json['actualCash'] as num?)?.toDouble(),
      excessCash: (json['excessCash'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SalesPerShiftDetailsToJson(
        SalesPerShiftDetails instance) =>
    <String, dynamic>{
      'openTime': _$JsonConverterToJson<String, DateTime>(
          instance.openTime, const DateTimeConverter().toJson),
      'closeTime': _$JsonConverterToJson<String, DateTime>(
          instance.closeTime, const DateTimeConverter().toJson),
      'branch': instance.branch,
      'register': instance.register,
      'openedBy': instance.openedBy,
      'closedBy': instance.closedBy,
      'totalSaleTransactions': instance.totalSaleTransactions,
      'totalReturnTransactions': instance.totalReturnTransactions,
      'totalDiscountedTransactions': instance.totalDiscountedTransactions,
      'totalGrossSalesAmount': instance.totalGrossSalesAmount,
      'totalSalesAmount': instance.totalSalesAmount,
      'totalReturnsAmount': instance.totalReturnsAmount,
      'totalDiscountedAmount': instance.totalDiscountedAmount,
      'netSales': instance.netSales,
      'netSalesCash': instance.netSalesCash,
      'openingCash': instance.openingCash,
      'closingCash': instance.closingCash,
      'actualCash': instance.actualCash,
      'excessCash': instance.excessCash,
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
