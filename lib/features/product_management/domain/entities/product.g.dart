// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      name: json['name'] as String,
      category: json['category'] as String,
      imageUrl: json['imageUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'tags': instance.tags,
      'category': instance.category,
      'variants': instance.variants,
    };
