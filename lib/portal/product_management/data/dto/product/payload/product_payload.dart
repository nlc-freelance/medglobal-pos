import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/variant_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

part 'product_payload.g.dart';

@JsonSerializable()
class ProductPayload {
  final String? name;
  final String? category;
  final String? productImageUrl;
  final List<VariantPayload>? variants;

  const ProductPayload({
    this.name,
    this.category,
    this.productImageUrl,
    this.variants,
  });

  Map<String, dynamic> toJson() => _$ProductPayloadToJson(this);

  factory ProductPayload.fromProduct(Product product, {bool isUpdate = false}) {
    return ProductPayload(
      name: product.name,
      category: product.category?.name,
      productImageUrl: product.imageUrl,
      variants: product.variants.map((variant) => VariantPayload.fromVariant(variant, isUpdate: isUpdate)).toList(),
    );
  }
}
