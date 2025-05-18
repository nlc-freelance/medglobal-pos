import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'variant.g.dart';

@JsonSerializable()
class Variant extends Equatable {
  final int? id;
  final String? name;
  final String? sku;
  final int? warningStock;
  final int? idealStock;
  final double? cost;
  final List<Supplier>? suppliers;
  final List<BranchInventory>? branchInventories;

  const Variant({
    this.id,
    this.name,
    this.sku,
    this.suppliers,
    this.warningStock,
    this.idealStock,
    this.cost,
    this.branchInventories,
  });

  @override
  List<Object?> get props => [id, name, sku, warningStock, idealStock, cost, suppliers, branchInventories];

  factory Variant.fromJson(Map<String, dynamic> json) => _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);

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
      return branchInventories?.every((inventory) => inventory.price! > 0) == true;
    } else {
      return false;
    }
  }

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<List<String>>(
            columnName: 'branches',
            value: branchInventories?.map((inventory) => inventory.branch?.name ?? '').toList() ?? <String>[],
          ),
          DataGridCell<List<String>>(
            columnName: 'suppliers',
            value: suppliers?.map((supplier) => supplier.name).toList() ?? <String>[],
          ),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );

  Variant copyWith({
    int? id,
    String? name,
    String? sku,
    int? warningStock,
    int? idealStock,
    double? cost,
    List<Supplier>? suppliers,
    List<BranchInventory>? branchInventories,
  }) {
    return Variant(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      warningStock: warningStock ?? this.warningStock,
      idealStock: idealStock ?? this.idealStock,
      cost: cost ?? this.cost,
      suppliers: suppliers ?? this.suppliers,
      branchInventories: branchInventories ?? this.branchInventories,
    );
  }
}
