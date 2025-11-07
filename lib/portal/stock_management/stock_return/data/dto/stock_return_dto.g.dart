// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_return_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockReturnDto _$StockReturnDtoFromJson(Map<String, dynamic> json) =>
    StockReturnDto(
      id: json['id'] as int?,
      branch: json['store'] == null
          ? null
          : BranchPartialDto.fromJson(json['store'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      status: json['status'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => StockReturnItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StockReturnDtoToJson(StockReturnDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store': instance.branch,
      'supplier': instance.supplier,
      'status': instance.status,
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
