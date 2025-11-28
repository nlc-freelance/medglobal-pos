import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/variant_dto.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required String name,
    String? productImageUrl,
    CategoryDto? category,
    List<VariantDto>? variants,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
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
