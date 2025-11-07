// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransferItem _$StockTransferItemFromJson(Map<String, dynamic> json) =>
    StockTransferItem(
      id: json['id'] as int?,
      variantId: json['variantId'] as int?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      qtyAtSource: json['qtyAtSource'] as int?,
      qtyAtDestination: json['qtyAtDestination'] as int?,
      qtyToTransfer: json['qtyToTransfer'] as int?,
      qtyReceived: json['qtyReceived'] as int?,
      cost: (json['cost'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockTransferItemToJson(StockTransferItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variantId': instance.variantId,
      'name': instance.name,
      'sku': instance.sku,
      'qtyAtSource': instance.qtyAtSource,
      'qtyAtDestination': instance.qtyAtDestination,
      'qtyToTransfer': instance.qtyToTransfer,
      'qtyReceived': instance.qtyReceived,
      'cost': instance.cost,
      'total': instance.total,
    };
