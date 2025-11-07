// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPayload _$ProductPayloadFromJson(Map<String, dynamic> json) =>
    ProductPayload(
      name: json['name'] as String?,
      category: json['category'] as String?,
      productImageUrl: json['productImageUrl'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => VariantPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductPayloadToJson(ProductPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'productImageUrl': instance.productImageUrl,
      'variants': instance.variants,
    };
