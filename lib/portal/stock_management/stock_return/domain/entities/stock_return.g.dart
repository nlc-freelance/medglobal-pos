// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockReturn _$StockReturnFromJson(Map<String, dynamic> json) => StockReturn(
      id: json['id'] as int?,
      branch: json['branch'] == null
          ? null
          : BranchPartial.fromJson(json['branch'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StockOrderStatusEnumMap, json['status']),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StockReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StockReturnToJson(StockReturn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'supplier': instance.supplier,
      'status': _$StockOrderStatusEnumMap[instance.status],
      'totalAmount': instance.totalAmount,
      'tax': instance.tax,
      'discount': instance.discount,
      'notes': instance.notes,
      'items': instance.items,
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
