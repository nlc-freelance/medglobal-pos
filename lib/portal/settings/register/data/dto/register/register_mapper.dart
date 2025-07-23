import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register/register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift/register_shift_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

class RegisterMapper {
  RegisterMapper._();

  static Register fromDto(RegisterDto dto) {
    return Register(
      id: dto.id,
      name: dto.name,
      serialNumber: dto.serialNumber,
      assignedBranch: dto.store != null ? BranchMapper.fromDto(dto.store!) : null,
      shiftDetail: dto.shiftDetail != null ? RegisterShiftMapper.fromDto(dto.shiftDetail!) : null,
    );
  }
}
