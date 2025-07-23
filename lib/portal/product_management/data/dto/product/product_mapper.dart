import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_mapper.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/product_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/variant_mapper.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

class ProductMapper {
  ProductMapper._();

  /// Converts a [ProductDto] to a [Product] entity
  static Product fromDto(ProductDto dto) {
    return Product(
      id: dto.id,
      name: dto.name,
      imageUrl: dto.productImageUrl,
      category: dto.category == null ? null : CategoryMapper.fromDto(dto.category!),
      variants: dto.variants?.map((variant) => VariantMapper.fromDto(variant)).toList() ?? [],
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  /// Converts a list of [ProductDto] to [Product] entities
  static PaginatedList<Product> fromDtoList(PaginatedList<ProductDto> dto) {
    return dto.convert(fromDto);
  }
}
