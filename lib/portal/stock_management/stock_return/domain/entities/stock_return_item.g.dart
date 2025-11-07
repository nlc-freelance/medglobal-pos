// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_return_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockReturnItem _$StockReturnItemFromJson(Map<String, dynamic> json) =>
    StockReturnItem(
      id: json['id'] as int?,
      variantId: json['variantId'] as int?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      qtyOnHand: json['qtyOnHand'] as int?,
      qtyToReturn: json['qtyToReturn'] as int?,
      supplierPrice: (json['supplierPrice'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockReturnItemToJson(StockReturnItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantId': instance.variantId,
      'name': instance.name,
      'sku': instance.sku,
      'qtyOnHand': instance.qtyOnHand,
      'qtyToReturn': instance.qtyToReturn,
      'supplierPrice': instance.supplierPrice,
      'total': instance.total,
    };
