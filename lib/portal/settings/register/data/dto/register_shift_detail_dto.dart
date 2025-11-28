import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';

part 'register_shift_detail_dto.freezed.dart';
part 'register_shift_detail_dto.g.dart';

@freezed
class RegisterShiftDetailDto with _$RegisterShiftDetailDto {
  const factory RegisterShiftDetailDto({
    required String status,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
  }) = _RegisterShiftDetailDto;

  factory RegisterShiftDetailDto.fromJson(Map<String, dynamic> json) => _$RegisterShiftDetailDtoFromJson(json);
}
