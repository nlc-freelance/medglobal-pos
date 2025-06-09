import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_config.freezed.dart';
part 'receipt_config.g.dart';

@freezed
class ReceiptConfig with _$ReceiptConfig {
  const factory ReceiptConfig({
    required int id,
    required int accountId,
    required String name,
    @Default(false) bool showBranchName,
    @Default(false) bool showBranchContact,
    @Default(false) bool showFooterMessage,
    String? footerTitle,
    String? footerMessage,
    String? companyName,
    String? branchName,
    String? branchAddress,
    String? branchPhone,
    String? branchEmail,
  }) = _ReceiptConfig;

  factory ReceiptConfig.fromJson(Map<String, dynamic> json) => _$ReceiptConfigFromJson(json);
}
