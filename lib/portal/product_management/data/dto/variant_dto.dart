import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/constants/strings.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/branch_inventory_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'variant_dto.g.dart';

@JsonSerializable()
class VariantDto extends Equatable {
  final int? id;
  final String? name;
  final String? sku;
  final List<Supplier>? suppliers;
  final int? warningStock;
  final int? idealStock;
  final double? cost;
  @JsonKey(name: 'variantStoreDetails')
  final List<BranchInventoryDto>? branchInventories;

  /// Variant objects in Stock management
  final ProductDto? product;
  @JsonKey(name: 'currentStock')
  final int? qtyOnHand;

  const VariantDto({
    this.id,
    this.name,
    this.sku,
    this.suppliers,
    this.warningStock,
    this.idealStock,
    this.cost,
    this.branchInventories,
    this.product,
    this.qtyOnHand,
  });

  @override
  List<Object?> get props =>
      [id, name, sku, warningStock, idealStock, cost, suppliers, branchInventories, product, qtyOnHand];

  factory VariantDto.fromJson(Map<String, dynamic> json) => _$VariantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VariantDtoToJson(this);

  Variant toEntity() => Variant(
        id: id,
        name: name ?? Strings.empty,
        sku: sku,
        suppliers: suppliers ?? <Supplier>[],
        warningStock: warningStock ?? 0,
        idealStock: idealStock ?? 0,
        cost: cost ?? 0,
        branchInventories: branchInventories?.map((inventory) => inventory.toEntity()).toList() ?? [],
      );
}
