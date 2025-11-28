import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_shift_detail_dto.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required int id,
    required String name,
    BranchDto? store,
    RegisterShiftDetailDto? shiftDetail,
    String? serialNumber,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);
}

@freezed
class RegisterPartialDto with _$RegisterPartialDto {
  const factory RegisterPartialDto({
    required int id,
    required String name,
    String? serialNumber,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _RegisterPartialDto;

  factory RegisterPartialDto.fromJson(Map<String, dynamic> json) => _$RegisterPartialDtoFromJson(json);
}
