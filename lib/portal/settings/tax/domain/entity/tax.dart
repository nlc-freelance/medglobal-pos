import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'tax.freezed.dart';

@freezed
class Tax with _$Tax {
  const factory Tax({
    int? id,
    required String code,
    required double rate,
    @Default(false) bool isDefault,
  }) = _Tax;
}

extension TaxExt on Tax {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'tax_code', value: code),
          DataGridCell<String>(columnName: 'tax_rate', value: '$rate%'),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
}
