import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'create_receipt_template_dto.g.dart';

@JsonSerializable()
class CreateReceiptTemplateDto {
  final String name;
  final String? description;
  final bool? isDefault;
  final bool? showCompanyName;
  final bool? showBranchName;
  final bool? showBranchAddress;
  final bool? showBranchContactDetails;
  final bool? showFooterMessage;
  final String? footerTitle;
  final String? footerMessage;

  CreateReceiptTemplateDto({
    required this.name,
    this.isDefault,
    this.description,
    this.showCompanyName,
    this.showBranchName,
    this.showBranchAddress,
    this.showBranchContactDetails,
    this.showFooterMessage,
    this.footerTitle,
    this.footerMessage,
  });

  Map<String, dynamic> toJson() => _$CreateReceiptTemplateDtoToJson(this);

  /// Mapping from domain entity
  factory CreateReceiptTemplateDto.fromDomain(ReceiptTemplate receipt) => CreateReceiptTemplateDto(
        name: receipt.name,
        description: receipt.description,
        isDefault: receipt.isDefault,
        showCompanyName: receipt.showCompanyName,
        showBranchName: receipt.showBranchName,
        showBranchAddress: receipt.showBranchAddress,
        showBranchContactDetails: receipt.showBranchContactDetails,
        showFooterMessage: receipt.showFooterMessage,
        footerTitle: receipt.footerTitle,
        footerMessage: receipt.footerMessage,
      );
}
