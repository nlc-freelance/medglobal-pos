// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['productImageUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] as String?,
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => VariantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productImageUrl': instance.imageUrl,
      'tags': instance.tags,
      'category': instance.category,
      'variants': instance.variants,
    };
