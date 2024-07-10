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

  Map<String, String?> validate() {
    Map<String, String?> errors = {};

    if (branch == null) {
      errors['branch'] = 'Branch is required';
    }

    if (price == null || price! <= 0) {
      errors['price'] = 'Price must be greater than 0';
    }

    if (qtyOnHand == null || qtyOnHand! <= 0) {
      errors['qtyOnHand'] = 'Quantity on hand must be greater than 0';
    }

    return errors;
  }

  BranchInventory copyWith({
    int? id,
    Branch? branch,
    double? price,
    int? qtyOnHand,
  }) {
    return BranchInventory(
      id: id ?? this.id,
      branch: branch ?? this.branch,
      price: price ?? this.price,
      qtyOnHand: qtyOnHand ?? this.qtyOnHand,
    );
  }
}
