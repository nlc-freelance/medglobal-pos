// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemPayload _$OrderItemPayloadFromJson(Map<String, dynamic> json) =>
    OrderItemPayload(
      variantId: json['variantId'] as int,
      quantity: json['quantity'] as int,
      discount: (json['discount'] as num?)?.toDouble(),
      discountType: json['discountType'] as String?,
    );

Map<String, dynamic> _$OrderItemPayloadToJson(OrderItemPayload instance) =>
    <String, dynamic>{
      'variantId': instance.variantId,
      'quantity': instance.quantity,
      'discount': instance.discount,
      'discountType': instance.discountType,
    };
