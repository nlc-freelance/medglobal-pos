import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

class ReceiptTemplateMapper {
  ReceiptTemplateMapper._();

  static ReceiptTemplate fromDto(ReceiptTemplateDto dto) {
    return ReceiptTemplate(
      id: dto.id,
      accountId: dto.accountId,
      name: dto.name,
      description: dto.description,
      isSystemDefault: dto.isSystemDefault,
      isDefault: dto.isDefault,
      showCompanyName: dto.showCompanyName,
      showBranchName: dto.showBranchName,
      showBranchAddress: dto.showBranchAddress,
      showBranchContact: dto.showBranchContact,
      showFooterMessage: dto.showFooterMessage,
      footerTitle: dto.footerTitle,
      footerMessage: dto.footerMessage,
    );
  }
}
