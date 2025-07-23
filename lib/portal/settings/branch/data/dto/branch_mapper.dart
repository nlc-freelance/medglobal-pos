import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_mapper.dart';

class BranchMapper {
  BranchMapper._();

  static Branch fromDto(BranchDto dto) {
    return Branch(
      id: dto.id,
      name: dto.name,
      accountId: dto.accountId,
      code: dto.code,
      email: dto.email,
      phone: dto.phone,
      street1: dto.street1,
      street2: dto.street2,
      city: dto.city,
      postalCode: dto.zipCode,
      state: dto.state,
      country: dto.country,
      businessRegistrationNumber: dto.businessRegistrationNo,
      vatIdNumber: dto.vatIdNo,
      receiptTemplate: ReceiptTemplateMapper.fromDto(dto.receiptTemplate),
    );
  }
}
