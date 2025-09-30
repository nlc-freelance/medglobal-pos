import 'package:medglobal_admin_portal/pos/register_shift/data/dto/register_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift.dart';

class RegisterShiftMapper {
  RegisterShiftMapper._();

  static RegisterShift fromDto(RegisterShiftDto dto) {
    return RegisterShift(
      status: dto.status,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
