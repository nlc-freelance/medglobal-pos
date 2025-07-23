import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/branch_inventory/branch_inventory.dart';

part 'branch_inventory_payload.g.dart';

@JsonSerializable()
class BranchInventoryPayload {
  final int? id;
  final int? store;
  final double? price;
  final int? currentStock;

  const BranchInventoryPayload({
    this.id,
    this.store,
    this.price,
    this.currentStock,
  });

  factory BranchInventoryPayload.fromJson(Map<String, dynamic> json) => _$BranchInventoryPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$BranchInventoryPayloadToJson(this);

  factory BranchInventoryPayload.fromBranchInventory(BranchInventory inventory, {bool isUpdate = false}) {
    return BranchInventoryPayload(
      id: isUpdate ? inventory.id : null,
      store: inventory.branch.id,
      price: inventory.price,
      currentStock: inventory.quantityOnHand,
    );
  }
}
