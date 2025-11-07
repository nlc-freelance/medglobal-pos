// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductHistoryItem _$ProductHistoryItemFromJson(Map<String, dynamic> json) =>
    ProductHistoryItem(
      id: json['id'] as int?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      employeeName: json['employeeName'] as String?,
      action:
          $enumDecodeNullable(_$ProductHistoryActionEnumMap, json['action']),
      qtyBefore: json['qtyBefore'] as int?,
      qtyAfter: json['qtyAfter'] as int?,
      change: json['change'] as int?,
    );

Map<String, dynamic> _$ProductHistoryItemToJson(ProductHistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime?.toIso8601String(),
      'employeeName': instance.employeeName,
      'action': _$ProductHistoryActionEnumMap[instance.action],
      'qtyBefore': instance.qtyBefore,
      'qtyAfter': instance.qtyAfter,
      'change': instance.change,
    };

const _$ProductHistoryActionEnumMap = {
  ProductHistoryAction.PURCHASE: 'PURCHASE',
  ProductHistoryAction.RETURN: 'RETURN',
  ProductHistoryAction.TAKE: 'TAKE',
  ProductHistoryAction.TRANSFER: 'TRANSFER',
  ProductHistoryAction.SALE: 'SALE',
  ProductHistoryAction.REFUND: 'REFUND',
  ProductHistoryAction.INITIAL: 'INITIAL',
};
