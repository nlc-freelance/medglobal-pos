import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/branch_inventory/branch_inventory_dto.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_dto.dart';

part 'variant_dto.freezed.dart';
part 'variant_dto.g.dart';

// products/{id}
@freezed
class VariantDto with _$VariantDto {
  const factory VariantDto({
    required int id,
    required String name,
    required String sku,
    int? warningStock,
    int? idealStock,
    required double cost,
    required List<SupplierDto> suppliers,
    required List<BranchInventoryDto> variantStoreDetails,
  }) = _VariantDto;

  factory VariantDto.fromJson(Map<String, dynamic> json) => _$VariantDtoFromJson(json);
}

// On transaction items
// @freezed
// class VariantLiteDto with _$VariantLiteDto {
//   const factory VariantLiteDto({
//     required int id,
//     required String displayName,
//     required String sku,
//   }) = _VariantLiteDto;

//   const VariantLiteDto._();

//   factory VariantLiteDto.fromJson(Map<String, dynamic> json) => _$VariantLiteDtoFromJson(json);

//   VariantLite toDomain() => VariantLite(
//         id: id,
//         displayName: displayName,
//         sku: sku,
//       );
// }

// @freezed
// class VariantPartialDto with _$VariantPartialDto {
//   const factory VariantPartialDto({
//     int? id,
//     required String name,
//     String? sku,
//     String? displayName,
//     int? warningStock,
//     int? idealStock,
//     int? currentStock,
//     double? cost,
//     double? price,
//     ProductDto? product,
//   }) = _VariantPartialDto;

//   const VariantPartialDto._();

//   factory VariantPartialDto.fromJson(Map<String, dynamic> json) => _$VariantPartialDtoFromJson(json);
// }
