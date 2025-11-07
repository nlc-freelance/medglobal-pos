// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransfer _$StockTransferFromJson(Map<String, dynamic> json) =>
    StockTransfer(
      id: json['id'] as int?,
      sourceBranch: json['sourceBranch'] == null
          ? null
          : BranchPartial.fromJson(
              json['sourceBranch'] as Map<String, dynamic>),
      destinationBranch: json['destinationBranch'] == null
          ? null
          : BranchPartial.fromJson(
              json['destinationBranch'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StockOrderStatusEnumMap, json['status']),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StockTransferItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      completedAt: _$JsonConverterFromJson<String, DateTime>(
          json['completedAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StockTransferToJson(StockTransfer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceBranch': instance.sourceBranch,
      'destinationBranch': instance.destinationBranch,
      'status': _$StockOrderStatusEnumMap[instance.status],
      'items': instance.items,
      'notes': instance.notes,
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
