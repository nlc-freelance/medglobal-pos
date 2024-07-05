import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';

part 'branch_inventory.g.dart';

@JsonSerializable()
class BranchInventory extends Equatable {
  final int? id;
  final Branch? branch;
  final double? price;
  final int? qtyOnHand;

  const BranchInventory({
    this.id,
    this.branch,
    this.price,
    this.qtyOnHand,
  });

  @override
  List<Object?> get props => [id, branch, price, qtyOnHand];

  factory BranchInventory.fromJson(Map<String, dynamic> json) => _$BranchInventoryFromJson(json);

  Map<String, dynamic> toJson() => _$BranchInventoryToJson(this);
}
