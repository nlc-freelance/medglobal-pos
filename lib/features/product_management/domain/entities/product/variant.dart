import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final BranchInventory? branchSaleDetail;

  const Variant({
    this.id,
    this.name,
    this.sku,
    this.suppliers,
    this.warningStock,
    this.idealStock,
    this.branchSaleDetail,
  });

  @override
  List<Object?> get props => [id, name, suppliers, warningStock, idealStock, branchSaleDetail];

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);

  dynamic get(String prop) => prop;

  Variant copyWith({
    int? id,
    String? name,
    String? sku,
    int? warningStock,
    int? idealStock,
    List<Supplier>? suppliers,
    BranchInventory? branchSaleDetail,
  }) {
    return Variant(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      warningStock: warningStock ?? this.warningStock,
      idealStock: idealStock ?? this.idealStock,
      suppliers: suppliers ?? this.suppliers,
      branchSaleDetail: branchSaleDetail ?? this.branchSaleDetail,
    );
  }
}
