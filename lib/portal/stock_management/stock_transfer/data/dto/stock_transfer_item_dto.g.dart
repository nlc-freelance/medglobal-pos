// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transfer_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransferItemDto _$StockTransferItemDtoFromJson(
        Map<String, dynamic> json) =>
    StockTransferItemDto(
      id: json['id'] as int?,
      variant: json['variant'] == null
          ? null
          : ProductVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
      qtyAtSource: json['fromCurrentStock'] as int?,
      qtyAtDestination: json['toCurrentStock'] as int?,
      qtyToTransfer: json['quantityToTransfer'] as int?,
      qtyReceived: json['receivedQuantity'] as int?,
    );

Map<String, dynamic> _$StockTransferItemDtoToJson(
        StockTransferItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant': instance.variant,
      'fromCurrentStock': instance.qtyAtSource,
      'toCurrentStock': instance.qtyAtDestination,
      'quantityToTransfer': instance.qtyToTransfer,
      'receivedQuantity': instance.qtyReceived,
    };
