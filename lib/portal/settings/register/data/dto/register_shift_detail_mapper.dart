import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift_detail_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift_detail.dart';

class RegisterShiftDetailMapper {
  RegisterShiftDetailMapper._();

  static RegisterShiftDetail fromDto(RegisterShiftDetailDto dto) {
    return RegisterShiftDetail(
      status: dto.status,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
