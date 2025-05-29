import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'update_receipt_template_dto.g.dart';

@JsonSerializable()
class UpdateReceiptTemplateDto {
  final int id;
  final String? name;
  final String? description;
  final bool? isDefault;
  final bool? showCompanyName;
  final bool? showBranchName;
  final bool? showBranchAddress;
  final bool? showBranchContact;
  final bool? showFooterMessage;
  final String? footerTitle;
  final String? footerMessage;

  UpdateReceiptTemplateDto({
    required this.id,
    this.name,
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

  Map<String, dynamic> toJson() => _$UpdateReceiptTemplateDtoToJson(this);

  /// Mapping from domain entity
  factory UpdateReceiptTemplateDto.fromDomain(ReceiptTemplate receipt) => UpdateReceiptTemplateDto(
        id: receipt.id!,
        name: receipt.name,
        description: receipt.description,
        isDefault: receipt.isDefault,
        showCompanyName: true,
        showBranchName: receipt.showBranchName,
        showBranchAddress: true,
        showBranchContact: receipt.showBranchContact,
        showFooterMessage: receipt.showFooterMessage,
        footerTitle: receipt.footerTitle,
        footerMessage: receipt.footerMessage,
      );
}
