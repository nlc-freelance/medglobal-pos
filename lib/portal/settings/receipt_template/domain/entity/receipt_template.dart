import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'receipt_template.freezed.dart';

@freezed
class ReceiptTemplate with _$ReceiptTemplate {
  const factory ReceiptTemplate({
    int? id,
    required String name,
    String? description,
    @Default(false) bool isSystemDefault,
    @Default(false) bool isDefault,
    @Default(false) bool showCompanyName,
    @Default(false) bool showBranchName,
    @Default(false) bool showBranchAddress,
    @Default(false) bool showBranchContactDetails,
    @Default(false) bool showFooterMessage,
    String? footerTitle,
    String? footerMessage,
  }) = _ReceiptTemplate;

  const ReceiptTemplate._();

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'receipt_template_name', value: name),
          DataGridCell<String>(columnName: 'receipt_template_description', value: description),
        ],
      );
}
