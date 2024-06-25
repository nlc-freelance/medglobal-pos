// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGrid _$ProductGridFromJson(Map<String, dynamic> json) => ProductGrid(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      sku: json['sku'] as String,
      barcode: json['barcode'] as String,
      cost: (json['cost'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      margin: json['margin'] as int,
      qty: json['qty'] as int,
    );

Map<String, dynamic> _$ProductGridToJson(ProductGrid instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'sku': instance.sku,
      'barcode': instance.barcode,
      'cost': instance.cost,
      'price': instance.price,
      'margin': instance.margin,
      'qty': instance.qty,
    };
