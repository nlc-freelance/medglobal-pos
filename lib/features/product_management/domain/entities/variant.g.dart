// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      id: json['id'] as int?,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      suppliers:
          (json['suppliers'] as List<dynamic>?)?.map((e) => e as int).toList(),
      warningStock: json['warningStock'] as int?,
      idealStock: json['idealStock'] as int?,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'suppliers': instance.suppliers,
      'warningStock': instance.warningStock,
      'idealStock': instance.idealStock,
    };
