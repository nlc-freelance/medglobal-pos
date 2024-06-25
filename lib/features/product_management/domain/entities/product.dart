import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/variant.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final int? id;
  final String name;
  final String? imageUrl;
  final List<String>? tags;
  final String category;
  final List<Variant>? variants;

  const Product({
    this.id,
    required this.name,
    required this.category,
    this.imageUrl,
    this.tags,
    this.variants,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, tags, category, variants];

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  ProductDto toDto() => ProductDto(
        name: name,
        imageUrl: imageUrl,
        category: category,
        variants: variants?.map((variant) => variant.toDto()).toList(),
      );
}
