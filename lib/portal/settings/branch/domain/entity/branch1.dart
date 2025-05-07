import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'branch1.freezed.dart';

@freezed
class Branch1 with _$Branch1 {
  const factory Branch1({
    int? id,
    required String name,
    required String phone,
    String? email,
    required String street1,
    required String street2,
    required String city,
    required String state,
    required String postalCode,
    required String country,
    required String businessRegistrationNumber,
    String? vatIdNumber,
    // Receipt template
  }) = _Branch1;

  const Branch1._();

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'branch_name', value: name),
          DataGridCell<String>(columnName: 'phone', value: phone),
          DataGridCell<String>(columnName: 'address', value: address),
        ],
      );

  String get address => '$street1 $street2, $city, $state $postalCode, $country';
}
