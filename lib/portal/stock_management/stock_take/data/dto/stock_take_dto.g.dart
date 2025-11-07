// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTakeDto _$StockTakeDtoFromJson(Map<String, dynamic> json) => StockTakeDto(
      id: json['id'] as int?,
      branch: json['store'] == null
          ? null
          : BranchPartialDto.fromJson(json['store'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      status: json['status'] as String?,
      isAllSupplier: json['isAllSupplier'] as bool?,
      description: json['notes'] as String?,
      totalQtyDifference: json['totalQuantityDifference'] as int?,
      totalCostDifference: (json['totalCostDifference'] as num?)?.toDouble(),
      items: (json['stockTakeDetails'] as List<dynamic>?)
          ?.map((e) => StockTakeItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedAt: _$JsonConverterFromJson<String, DateTime>(
          json['completedAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StockTakeDtoToJson(StockTakeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store': instance.branch,
      'supplier': instance.supplier,
      'isAllSupplier': instance.isAllSupplier,
      'status': instance.status,
      'totalQuantityDifference': instance.totalQtyDifference,
      'totalCostDifference': instance.totalCostDifference,
      'stockTakeDetails': instance.items,
      'notes': instance.description,
      'completedAt': _$JsonConverterToJson<String, DateTime>(
          instance.completedAt, const DateTimeConverter().toJson),
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
