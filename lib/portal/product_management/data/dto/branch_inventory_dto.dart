import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/branch_inventory.dart';

part 'branch_inventory_dto.g.dart';

@JsonSerializable()
class BranchInventoryDto extends Equatable {
  final int? id;
  @JsonKey(name: 'store')
  final Branch? branch;
  final double? price;
  @JsonKey(name: 'currentStock')
  final int? qtyOnHand;

  const BranchInventoryDto({
    this.id,
    this.branch,
    this.price,
    this.qtyOnHand,
  });

  @override
  List<Object?> get props => [id, branch, price, qtyOnHand];

  factory BranchInventoryDto.fromJson(Map<String, dynamic> json) => _$BranchInventoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BranchInventoryDtoToJson(this);

  BranchInventory toEntity() => BranchInventory(
        id: id,
        branch: branch,
        price: price,
        qtyOnHand: qtyOnHand,
      );
}
