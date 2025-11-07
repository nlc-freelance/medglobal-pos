// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_return_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockReturnItemDto _$StockReturnItemDtoFromJson(Map<String, dynamic> json) =>
    StockReturnItemDto(
      id: json['id'] as int?,
      variant: json['variant'] == null
          ? null
          : ProductVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
      qtyToReturn: json['quantity'] as int?,
      supplierPrice: (json['supplierPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StockReturnItemDtoToJson(StockReturnItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant': instance.variant,
      'quantity': instance.qtyToReturn,
      'supplierPrice': instance.supplierPrice,
    };
