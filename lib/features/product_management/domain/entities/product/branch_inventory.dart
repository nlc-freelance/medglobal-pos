import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: branch?.name),
          DataGridCell<double>(columnName: 'price', value: price),
          DataGridCell<int>(columnName: 'qty_on_hand', value: qtyOnHand),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );

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
