import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';

class TaxMapper {
  TaxMapper._();

  static Tax fromDto(TaxDto dto) {
    return Tax(
      id: dto.id,
      code: dto.name,
      rate: dto.percentage,
      isDefault: dto.isDefault,
    );
  }
}
