// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransferDto _$StockTransferDtoFromJson(Map<String, dynamic> json) =>
    StockTransferDto(
      id: json['id'] as int?,
      sourceBranch: json['fromStore'] == null
          ? null
          : BranchPartialDto.fromJson(
              json['fromStore'] as Map<String, dynamic>),
      destinationBranch: json['toStore'] == null
          ? null
          : BranchPartialDto.fromJson(json['toStore'] as Map<String, dynamic>),
      status: json['status'] as String?,
      items: (json['stockTransferDetails'] as List<dynamic>?)
          ?.map((e) => StockTransferItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] as String?,
      completedAt: _$JsonConverterFromJson<String, DateTime>(
          json['completedAt'], const DateTimeConverter().fromJson),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$StockTransferDtoToJson(StockTransferDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromStore': instance.sourceBranch,
      'toStore': instance.destinationBranch,
      'status': instance.status,
      'stockTransferDetails': instance.items,
      'notes': instance.notes,
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
