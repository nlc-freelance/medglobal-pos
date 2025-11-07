// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTakeItem _$StockTakeItemFromJson(Map<String, dynamic> json) =>
    StockTakeItem(
      id: json['id'] as int?,
      variantId: json['variantId'] as int?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      qtyCounted: json['qtyCounted'] as int?,
      qtyExpected: json['qtyExpected'] as int?,
      difference: json['difference'] as int?,
      costDifference: (json['costDifference'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockTakeItemToJson(StockTakeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantId': instance.variantId,
      'name': instance.name,
      'sku': instance.sku,
      'qtyCounted': instance.qtyCounted,
      'qtyExpected': instance.qtyExpected,
      'difference': instance.difference,
      'costDifference': instance.costDifference,
    };
