import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required String name,
    String? productImageUrl,
    CategoryDto? category,
    required List<VariantDto> variants,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _ProductDto;

  const ProductDto._();

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Product toDomain() => Product(
        id: id,
        name: name,
        imageUrl: productImageUrl,
        category: category?.toEntity(),
        variants: variants.map((variant) => variant.toDomain()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@freezed
class ProductLiteDto with _$ProductLiteDto {
  const factory ProductLiteDto({
    required int id,
    required String name,
  }) = _ProductLiteDto;

  const ProductLiteDto._();

  factory ProductLiteDto.fromJson(Map<String, dynamic> json) => _$ProductLiteDtoFromJson(json);

  ProductLite toDomain() => ProductLite(
        id: id,
        name: name,
      );
}


// part 'product_dto.g.dart';

// @JsonSerializable()
// class ProductDto extends Equatable {
//   final int? id;
//   final String? name;
//   @JsonKey(name: 'productImageUrl')
//   final String? imageUrl;
//   // final List<String>? tags;
//   final CategoryDto? category;
//   final List<VariantDto>? variants;
//   @DateTimeConverter()
//   final DateTime? createdAt;
//   @DateTimeConverter()
//   final DateTime? updatedAt;

//   const ProductDto({
//     this.id,
//     this.name,
//     this.imageUrl,
//     // this.tags,
//     this.category,
//     this.variants,
//     this.createdAt,
//     this.updatedAt,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         name,
//         imageUrl,
//         // tags,
//         category,
//         variants,
//         createdAt,
//         updatedAt,
//       ];

//   factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

//   Product toEntity() => Product(
//         id: id,
//         name: name ?? Strings.empty,
//         imageUrl: imageUrl,
//         category: category?.toEntity(),
//         variants: variants?.map((variant) => variant.toEntity()).toList(),
//         createdAt: createdAt,
//         updatedAt: updatedAt,
//       );
// }
