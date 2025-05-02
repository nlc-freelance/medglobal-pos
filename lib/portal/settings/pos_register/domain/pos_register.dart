import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'pos_register.freezed.dart';

@freezed
class PosRegister with _$PosRegister {
  const factory PosRegister({
    int? id,
    required String name,
    required Branch assignedBranch,
  }) = _PosRegister;

  const PosRegister._();

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<int>(columnName: 'register_id', value: id),
          DataGridCell<String>(columnName: 'register_name', value: name),
          DataGridCell<String>(columnName: 'register_name', value: assignedBranch.name),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
}
