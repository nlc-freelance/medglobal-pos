import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/variant/branch_inventory/branch_inventory_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/variant/variant.dart';

part 'variant_payload.g.dart';

@JsonSerializable()
class VariantPayload {
  final int? id;
  final String? name;
  final String? sku;
  final int? warningStock;
  final int? idealStock;
  final double? cost;
  final List<int>? suppliers;
  final List<BranchInventoryPayload>? stores;

  const VariantPayload({
    this.name,
    this.id,
    this.sku,
    this.warningStock,
    this.idealStock,
    this.cost,
    this.suppliers,
    this.stores,
  });

  factory VariantPayload.fromJson(Map<String, dynamic> json) => _$VariantPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$VariantPayloadToJson(this);

  factory VariantPayload.fromVariant(Variant variant, {bool isUpdate = false}) {
    return VariantPayload(
      id: isUpdate ? variant.id : null,
      name: variant.name,
      sku: variant.sku,
      warningStock: variant.warningStock,
      idealStock: variant.idealStock,
      cost: variant.cost,
      suppliers: variant.suppliers.map((supplier) => supplier.id!).toList(),
      stores: variant.branchInventories.map((detail) => BranchInventoryPayload.fromBranchInventory(detail)).toList(),
    );
  }
}
