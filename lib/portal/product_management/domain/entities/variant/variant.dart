import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/branch_inventory/branch_inventory.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'variant.freezed.dart';

@freezed
class Variant with _$Variant {
  const factory Variant({
    required int id,
    required String name,
    required String sku,
    int? warningStock,
    int? idealStock,
    required double cost,
    required List<Supplier> suppliers,
    required List<BranchInventory> branchInventories,
  }) = _Variant;
}

extension VariantExt on Variant {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<String>(
            columnName: 'branches',
            value: branchInventories.map((inventory) => inventory.branch.name).join(', '),
          ),
          DataGridCell<String>(
            columnName: 'suppliers',
            value: suppliers.map((supplier) => supplier.name).join(', '),
          ),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
}
