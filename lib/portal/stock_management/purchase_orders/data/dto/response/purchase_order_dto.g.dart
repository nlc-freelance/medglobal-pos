// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderDtoImpl _$$PurchaseOrderDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderDtoImpl(
      id: json['id'] as int,
      store: json['store'] == null
          ? null
          : BranchPartialDto.fromJson(json['store'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : SupplierDto.fromJson(json['supplier'] as Map<String, dynamic>),
      status: json['status'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PurchaseOrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      estimatedDateOfArrival: _$JsonConverterFromJson<String, DateTime>(
          json['estimatedDateOfArrival'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$PurchaseOrderDtoImplToJson(
        _$PurchaseOrderDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
      'supplier': instance.supplier,
      'status': instance.status,
      'totalAmount': instance.totalAmount,
      'tax': instance.tax,
      'discount': instance.discount,
      'notes': instance.notes,
      'items': instance.items,
      'estimatedDateOfArrival': _$JsonConverterToJson<String, DateTime>(
          instance.estimatedDateOfArrival, const DateTimeConverter().toJson),
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
