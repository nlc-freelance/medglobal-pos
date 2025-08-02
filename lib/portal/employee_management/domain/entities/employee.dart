import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/constants/constants.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/access_control.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/system_access_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'employee.freezed.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    int? id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required List<BranchPartial> assignedBranches,
    required EmployeeRole role,
    required List<SystemAccess> systemAccess,
    required List<AccessControl> accessControls,
  }) = _Employee;

  const Employee._();

  String get name => '$firstName $lastName';

  String get assignedBranch =>
      assignedBranches.isEmpty ? Strings.noValue : assignedBranches.map((branch) => branch.name).toList().join(', ');

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'employee_name', value: name),
          DataGridCell<String>(columnName: 'branch', value: assignedBranch),
          DataGridCell<String>(columnName: 'email', value: email),
          DataGridCell<String>(columnName: 'phone', value: phone),
          DataGridCell<EmployeeRole>(columnName: 'role', value: role),
        ],
      );
}

@freezed
class EmployeePartial with _$EmployeePartial {
  const factory EmployeePartial({
    required int id,
    required String firstName,
    required String lastName,
  }) = _EmployeePartial;
}

extension EmployeePartialExt on EmployeePartial {
  String get name => '$firstName $lastName';
}
