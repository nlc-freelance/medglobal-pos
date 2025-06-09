import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/response/register_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
class RegisterLiteDto with _$RegisterLiteDto {
  const factory RegisterLiteDto({
    required int id,
    required String name,
  }) = _RegisterLiteDto;

  const RegisterLiteDto._();

  factory RegisterLiteDto.fromJson(Map<String, dynamic> json) => _$RegisterLiteDtoFromJson(json);

  factory RegisterLiteDto.fromDomain(RegisterLite register) => RegisterLiteDto(
        id: register.id,
        name: register.name,
      );

  RegisterLite toDomain() => RegisterLite(
        id: id,
        name: name,
      );
}

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required int id,
    required String name,
    BranchLiteDto? store,
    // BranchDto? store,
    RegisterShiftDto? shiftDetail,
    String? serialNumber,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _RegisterDto;

  const RegisterDto._();

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

  Register toDomain() => Register(
        id: id,
        name: name,
        assignedBranch: store?.toDomain(),
        shiftDetail: shiftDetail?.toDomain(),
      );
}
