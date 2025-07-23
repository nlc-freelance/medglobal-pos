import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
class Branch with _$Branch {
  const factory Branch({
    int? id,
    required String name,
    required int accountId,
    String? code,
    required String phone,
    String? email,
    required String street1,
    String? street2,
    required String city,
    required String state,
    String? postalCode,
    String? country,
    required String businessRegistrationNumber,
    String? vatIdNumber,
    required ReceiptTemplate receiptTemplate,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

extension BranchExt on Branch {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'branch_name', value: name),
          DataGridCell<String>(columnName: 'phone', value: phone),
          DataGridCell<String>(columnName: 'address', value: address),
        ],
      );

  String get address =>
      [street1, street2, city, state, postalCode, country].where((item) => item?.isNotEmpty == true).join(', ');
}
