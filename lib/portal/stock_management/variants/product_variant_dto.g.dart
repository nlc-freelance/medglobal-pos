// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariantDto _$ProductVariantDtoFromJson(Map<String, dynamic> json) =>
    ProductVariantDto(
      displayName: json['displayName'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      sku: json['sku'] as String?,
      warningStock: json['warningStock'] as int?,
      idealStock: json['idealStock'] as int?,
      qtyOnHand: json['currentStock'] as int?,
      cost: (json['cost'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      suppliers: (json['suppliers'] as List<dynamic>?)
          ?.map((e) => SupplierDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      product: json['product'] == null
          ? null
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      actionType: json['actionType'] as String?,
    );

Map<String, dynamic> _$ProductVariantDtoToJson(ProductVariantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'sku': instance.sku,
      'warningStock': instance.warningStock,
      'idealStock': instance.idealStock,
      'currentStock': instance.qtyOnHand,
      'cost': instance.cost,
      'price': instance.price,
      'product': instance.product,
      'suppliers': instance.suppliers,
      'actionType': instance.actionType,
    };
