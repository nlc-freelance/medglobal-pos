// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_take_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTakeItemDto _$StockTakeItemDtoFromJson(Map<String, dynamic> json) =>
    StockTakeItemDto(
      id: json['id'] as int?,
      variant: json['variant'] == null
          ? null
          : ProductVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
      qtyCounted: json['quantity'] as int?,
      difference: json['quantityDifference'] as int?,
      costDifference: (json['costDifference'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockTakeItemDtoToJson(StockTakeItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant': instance.variant,
      'quantity': instance.qtyCounted,
      'quantityDifference': instance.difference,
      'costDifference': instance.costDifference,
    };
