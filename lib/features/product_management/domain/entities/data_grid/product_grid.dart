import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_grid.g.dart';

/// ProductGrid is the model for the values displayed in ProductsPage which are composed of all product variants

@JsonSerializable()
class ProductGrid extends Equatable {
  final int id;
  final String name;
  final String category;
  final String sku;
  final String barcode;
  final double cost;
  final double price;
  final int margin;
  final int qty;

  const ProductGrid({
    required this.id,
    required this.name,
    required this.category,
    required this.sku,
    required this.barcode,
    required this.cost,
    required this.price,
    required this.margin,
    required this.qty,
  });

  @override
  List<Object?> get props => [id, name, category, sku, barcode, cost, price, margin, qty];

  Map<String, dynamic> toJson() => _$ProductGridToJson(this);

  dynamic get(String prop) => prop;
}
