import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/constants/constants.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'receipt_template.freezed.dart';
part 'receipt_template.g.dart';

@freezed
class ReceiptTemplate with _$ReceiptTemplate {
  const factory ReceiptTemplate({
    int? id,
    required int accountId,
    required String name,
    String? description,
    @Default(false) bool isSystemDefault,
    @Default(false) bool isDefault,
    @Default(false) bool showCompanyName,
    @Default(false) bool showBranchName,
    @Default(false) bool showBranchAddress,
    @Default(false) bool showBranchContact,
    @Default(false) bool showFooterMessage,
    String? footerTitle,
    String? footerMessage,
  }) = _ReceiptTemplate;

  factory ReceiptTemplate.fromJson(Map<String, dynamic> json) => _$ReceiptTemplateFromJson(json);
}

extension ReceiptTemplateExt on ReceiptTemplate {
  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'receipt_template_name', value: name),
          DataGridCell<String>(columnName: 'receipt_template_description', value: description ?? Strings.empty),
        ],
      );
}
