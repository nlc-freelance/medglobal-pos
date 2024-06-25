import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends Equatable {
  final int? id;
  final String? name; //
  @JsonKey(name: 'productImageUrl')
  final String? imageUrl;
  final List<String>? tags;
  final String? category; //
  final List<VariantDto>? variants;
  // if Product has no variants, should have properties for sku, price, suppliers, qty and stock levels too

  const ProductDto({
    this.id,
    this.name,
    this.imageUrl,
    this.tags,
    this.category,
    this.variants,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, tags, category, variants];

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

  Product toEntity() => Product(
        id: id,
        name: name ?? Strings.empty, //
        imageUrl: imageUrl,
        tags: tags,
        category: category ?? Strings.empty, //
        variants: variants?.map((variant) => variant.toEntity()).toList(),
      );
}
