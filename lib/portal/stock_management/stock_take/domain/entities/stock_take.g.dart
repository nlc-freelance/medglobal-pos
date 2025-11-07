// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTake _$StockTakeFromJson(Map<String, dynamic> json) => StockTake(
      id: json['id'] as int?,
      branch: json['branch'] == null
          ? null
          : BranchPartial.fromJson(json['branch'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StockOrderStatusEnumMap, json['status']),
      isAllSupplier: json['isAllSupplier'] as bool?,
      description: json['description'] as String?,
      totalQtyDifference: json['totalQtyDifference'] as int?,
      totalCostDifference: (json['totalCostDifference'] as num?)?.toDouble(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StockTakeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedAt: _$JsonConverterFromJson<String, DateTime>(
          json['completedAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StockTakeToJson(StockTake instance) => <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'supplier': instance.supplier,
      'isAllSupplier': instance.isAllSupplier,
      'status': _$StockOrderStatusEnumMap[instance.status],
      'description': instance.description,
      'totalQtyDifference': instance.totalQtyDifference,
      'totalCostDifference': instance.totalCostDifference,
      'items': instance.items,
      'completedAt': _$JsonConverterToJson<String, DateTime>(
          instance.completedAt, const DateTimeConverter().toJson),
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
    };

const _$StockOrderStatusEnumMap = {
  StockOrderStatus.NEW: 'NEW',
  StockOrderStatus.FOR_RECEIVING: 'FOR_RECEIVING',
  StockOrderStatus.IN_PROGRESS: 'IN_PROGRESS',
  StockOrderStatus.SHIPPED: 'SHIPPED',
  StockOrderStatus.COMPLETED: 'COMPLETED',
  StockOrderStatus.PENDING: 'PENDING',
  StockOrderStatus.CANCELLED: 'CANCELLED',
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
