// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
// import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';

// part 'register.g.dart';

// @JsonSerializable()
// class Register extends Equatable {
//   final int? id;
//   final String? name;
//   final Branch? branch;
//   final RegisterShift? shiftDetail;
//   final String? serialNumber;

//   const Register({
//     this.id,
//     this.name,
//     this.branch,
//     this.shiftDetail,
//     this.serialNumber,
//   });

//   @override
//   List<Object?> get props => [id, name, branch, shiftDetail, serialNumber];

//   factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

//   Map<String, dynamic> toJson() => _$RegisterToJson(this);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'register.freezed.dart';
// part 'register.g.dart';

@freezed
class Register with _$Register {
  const factory Register({
    int? id,
    required String name,
    Branch? assignedBranch,
    RegisterShift? shiftDetail,
    String? serialNumber,
  }) = _Register;

  // For old (MVP) implementations without request DTOs
  // factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);
}

extension RegisterExt on Register {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'register_name', value: name),
          DataGridCell<String>(columnName: 'assigned_branch', value: assignedBranch?.name),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
}
