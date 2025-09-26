import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_configuration.freezed.dart';
part 'receipt_configuration.g.dart';

@freezed
class ReceiptConfiguration with _$ReceiptConfiguration {
  const factory ReceiptConfiguration({
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
  }) = _ReceiptConfiguration;

  factory ReceiptConfiguration.fromJson(Map<String, dynamic> json) => _$ReceiptConfigurationFromJson(json);
}
