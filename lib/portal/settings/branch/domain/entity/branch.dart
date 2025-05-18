import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
class Branch with _$Branch {
  const factory Branch({
    int? id,
    required String name,
    required int accountId, //
    String? code,
    required String phone,
    String? email,
    required String street1,
    String? street2,
    required String city,
    required String state,
    String? postalCode,
    String? country,
    required String businessRegistrationNumber, //
    String? vatIdNumber,
    // Receipt template
  }) = _Branch;

  // For old (MVP) implementations without request DTOs
  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  const Branch._();

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
