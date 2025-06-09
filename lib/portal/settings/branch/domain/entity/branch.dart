import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'branch.freezed.dart';

// abstract class BranchBase {
//   int? get id;
//   String get name;
// }

@freezed
class BranchLite with _$BranchLite {
  const factory BranchLite({
    required int id,
    required String name,
    required String address,
    String? phone,
  }) = _BranchLite;
}

@freezed
class Branch with _$Branch {
  const Branch._();
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
