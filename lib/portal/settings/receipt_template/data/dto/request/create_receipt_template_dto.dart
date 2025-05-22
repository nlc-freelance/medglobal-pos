import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'create_receipt_template_dto.g.dart';

@JsonSerializable()
class CreateReceiptTemplateDto {
  final String name;
  final int accountId;
  final String? description;
  final bool? isDefault;
  final bool? showCompanyName;
  final bool? showBranchName;
  final bool? showBranchAddress;
  final bool? showBranchContact;
  final bool? showFooterMessage;
  final String? footerTitle;
  final String? footerMessage;

  CreateReceiptTemplateDto({
    required this.name,
    required this.accountId,
    this.isDefault,
    this.description,
    this.showCompanyName,
    this.showBranchName,
    this.showBranchAddress,
    this.showBranchContact,
    this.showFooterMessage,
    this.footerTitle,
    this.footerMessage,
  });

  Map<String, dynamic> toJson() => _$CreateReceiptTemplateDtoToJson(this);

  /// Mapping from domain entity
  factory CreateReceiptTemplateDto.fromDomain(ReceiptTemplate receipt) => CreateReceiptTemplateDto(
        name: receipt.name,
        accountId: receipt.accountId,
        description: receipt.description,
        isDefault: receipt.isDefault,
        showCompanyName: receipt.showCompanyName,
        showBranchName: receipt.showBranchName,
        showBranchAddress: receipt.showBranchAddress,
        showBranchContact: receipt.showBranchContact,
        showFooterMessage: receipt.showFooterMessage,
        footerTitle: receipt.footerTitle,
        footerMessage: receipt.footerMessage,
      );
}
