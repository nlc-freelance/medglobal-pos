// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductHistoryItemDto _$ProductHistoryItemDtoFromJson(
        Map<String, dynamic> json) =>
    ProductHistoryItemDto(
      transactionId: json['transactionId'] as int?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      employeeName: json['employeeName'] as String?,
      action: json['action'] as String?,
      qtyBefore: json['qtyBefore'] as int?,
      qtyAfter: json['qtyAfter'] as int?,
      difference: json['difference'] as int?,
    );

Map<String, dynamic> _$ProductHistoryItemDtoToJson(
        ProductHistoryItemDto instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'dateTime': instance.dateTime?.toIso8601String(),
      'employeeName': instance.employeeName,
      'action': instance.action,
      'qtyBefore': instance.qtyBefore,
      'qtyAfter': instance.qtyAfter,
      'difference': instance.difference,
    };
