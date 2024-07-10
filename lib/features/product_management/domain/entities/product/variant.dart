import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';

import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant extends Equatable {
  final int? id;
  final String? name;
  final String? sku;
  final int? warningStock;
  final int? idealStock;
  final List<Supplier>? suppliers;
  final List<BranchInventory>? branchInventories;

  const Variant({
    this.id,
    this.name,
    this.sku,
    this.suppliers,
    this.warningStock,
    this.idealStock,
    this.branchInventories,
  });

  @override
  List<Object?> get props => [id, name, sku, warningStock, idealStock, suppliers, branchInventories];

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);

  dynamic get(String prop) => prop;

  List<Branch> getAllBranches() {
    List<Branch> allBranches = [];

    branchInventories?.forEach((branchInventory) {
      if (branchInventory.branch != null) allBranches.add(branchInventory.branch!);
    });

    return allBranches;
  }

  bool get hasSuppliers => suppliers?.isNotEmpty == true;

  bool get hasBranchInventories {
    if (branchInventories?.isNotEmpty == true) {
      return branchInventories?.every((inventory) => inventory.price! > 0 && inventory.qtyOnHand! > 0) == true;
    } else {
      return false;
    }
  }

  Variant copyWith({
    int? id,
    String? name,
    String? sku,
    int? warningStock,
    int? idealStock,
    List<Supplier>? suppliers,
    List<BranchInventory>? branchInventories,
  }) {
    return Variant(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      warningStock: warningStock ?? this.warningStock,
      idealStock: idealStock ?? this.idealStock,
      suppliers: suppliers ?? this.suppliers,
      branchInventories: branchInventories ?? this.branchInventories,
    );
  }
}
