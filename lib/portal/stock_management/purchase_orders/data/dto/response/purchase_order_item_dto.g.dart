// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderItemDtoImpl _$$PurchaseOrderItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderItemDtoImpl(
      id: json['id'] as int,
      variant: json['variant'] == null
          ? null
          : ProductVariantDto.fromJson(json['variant'] as Map<String, dynamic>),
      orderedQuantity: json['orderedQuantity'] as int?,
      actualQuantity: json['actualQuantity'] as int?,
      supplierPrice: (json['supplierPrice'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PurchaseOrderItemDtoImplToJson(
        _$PurchaseOrderItemDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant': instance.variant,
      'orderedQuantity': instance.orderedQuantity,
      'actualQuantity': instance.actualQuantity,
      'supplierPrice': instance.supplierPrice,
      'price': instance.price,
    };
