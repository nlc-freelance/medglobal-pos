// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/core/constants/strings.dart';
// import 'package:medglobal_admin_portal/portal/product_management/data/dto/branch_inventory_dto.dart';
// import 'package:medglobal_admin_portal/portal/product_management/data/dto/product_dto.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
// import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

// part 'variant_dto.g.dart';

// @JsonSerializable()
// class VariantDto extends Equatable {
//   final int? id;
//   final String? name;
//   final String? sku;
//   final List<Supplier>? suppliers;
//   final int? warningStock;
//   final int? idealStock;
//   final double? cost;
//   @JsonKey(name: 'variantStoreDetails')
//   final List<BranchInventoryDto>? branchInventories;

//   /// Variant objects in Stock management
//   final ProductDto? product;
//   @JsonKey(name: 'currentStock')
//   final int? qtyOnHand;

//   const VariantDto({
//     this.id,
//     this.name,
//     this.sku,
//     this.suppliers,
//     this.warningStock,
//     this.idealStock,
//     this.cost,
//     this.branchInventories,
//     this.product,
//     this.qtyOnHand,
//   });

//   @override
//   List<Object?> get props =>
//       [id, name, sku, warningStock, idealStock, cost, suppliers, branchInventories, product, qtyOnHand];

//   factory VariantDto.fromJson(Map<String, dynamic> json) => _$VariantDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$VariantDtoToJson(this);

//   Variant toEntity() => Variant(
//         id: id,
//         name: name ?? Strings.empty,
//         sku: sku,
//         suppliers: suppliers ?? <Supplier>[],
//         warningStock: warningStock ?? 0,
//         idealStock: idealStock ?? 0,
//         cost: cost ?? 0,
//         branchInventories: branchInventories?.map((inventory) => inventory.toEntity()).toList() ?? [],
//       );
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/branch_inventory_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
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

  const VariantDto._();

  factory VariantDto.fromJson(Map<String, dynamic> json) => _$VariantDtoFromJson(json);

  Variant toDomain() => Variant(
        id: id,
        name: name,
        sku: sku,
        warningStock: warningStock,
        idealStock: idealStock,
        cost: cost,
        suppliers: suppliers.map((supplier) => supplier.toDomain()).toList(),
        branchInventories: variantStoreDetails.map((detail) => detail.toDomain()).toList(),
      );
}

// On transaction items
@freezed
class VariantLiteDto with _$VariantLiteDto {
  const factory VariantLiteDto({
    required int id,
    required String displayName,
    required String sku,
  }) = _VariantLiteDto;

  const VariantLiteDto._();

  factory VariantLiteDto.fromJson(Map<String, dynamic> json) => _$VariantLiteDtoFromJson(json);

  VariantLite toDomain() => VariantLite(
        id: id,
        displayName: displayName,
        sku: sku,
      );
}

@freezed
class VariantPartialDto with _$VariantPartialDto {
  const factory VariantPartialDto({
    int? id,
    required String name,
    String? sku,
    String? displayName,
    int? warningStock,
    int? idealStock,
    int? currentStock,
    double? cost,
    double? price,
    ProductLiteDto? product,
  }) = _VariantPartialDto;

  const VariantPartialDto._();

  factory VariantPartialDto.fromJson(Map<String, dynamic> json) => _$VariantPartialDtoFromJson(json);
}
