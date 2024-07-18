import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'supply_need.g.dart';

@JsonSerializable()
class SupplyNeed extends Equatable {
  final int? id;
  final Branch? branch;
  final String? variantName;
  final String? sku;
  final int? qty;
  final int? warningStock;
  final int? idealStock;
  final List<Supplier>? suppliers;

  const SupplyNeed({
    this.id,
    this.branch,
    this.variantName,
    this.sku,
    this.qty,
    this.warningStock,
    this.idealStock,
    this.suppliers,
  });

  @override
  List<Object?> get props => [id, branch, variantName, sku, qty, warningStock, idealStock, suppliers];

  factory SupplyNeed.fromJson(Map<String, dynamic> json) => _$SupplyNeedFromJson(json);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'branch', value: branch?.name),
          DataGridCell<String>(columnName: 'name', value: variantName),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty', value: qty),
          DataGridCell<int>(columnName: 'warning_stock', value: warningStock),
          DataGridCell<int>(columnName: 'ideal_stock', value: idealStock),
          DataGridCell<List<String>>(
            columnName: 'suppliers',
            value: suppliers?.map((supplier) => supplier.name).toList() ?? <String>[],
          ),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
}
