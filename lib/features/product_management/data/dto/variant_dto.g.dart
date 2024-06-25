// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantDto _$VariantDtoFromJson(Map<String, dynamic> json) => VariantDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      suppliers:
          (json['suppliers'] as List<dynamic>?)?.map((e) => e as int).toList(),
      warningStock: json['warningStock'] as int?,
      idealStock: json['idealStock'] as int?,
    );

Map<String, dynamic> _$VariantDtoToJson(VariantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'suppliers': instance.suppliers,
      'warningStock': instance.warningStock,
      'idealStock': instance.idealStock,
    };
