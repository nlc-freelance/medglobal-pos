import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? id;
  final String? name;
  final String? imageUrl;
  final Category? category;
  final List<Variant>? variants;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  final bool? isSelected;

  const Product({
    this.id,
    this.name,
    this.category,
    this.imageUrl,
    this.variants,
    this.createdAt,
    this.updatedAt,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, category, variants, createdAt, updatedAt, isSelected];

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // TODO; toBranchDataGridModel for product details viewing. price is editable but qtyOnHand is not

  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    Category? category,
    List<Variant>? variants,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSelected,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      variants: variants ?? this.variants,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
