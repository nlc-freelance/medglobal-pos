import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'branch_inventory.freezed.dart';

@freezed
class BranchInventory with _$BranchInventory {
  const factory BranchInventory({
    required int id,
    required Branch branch,
    double? price,
    int? quantityOnHand,
  }) = _BranchInventory;
}

extension BranchInventoryExt on BranchInventory {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: branch.name),
          DataGridCell<double?>(columnName: 'price', value: price),
          DataGridCell<int?>(columnName: 'qty_on_hand', value: quantityOnHand),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
}
