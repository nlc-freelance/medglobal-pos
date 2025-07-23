import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';

part 'register_shift_dto.freezed.dart';
part 'register_shift_dto.g.dart';

@freezed
class RegisterShiftDto with _$RegisterShiftDto {
  const factory RegisterShiftDto({
    required String status,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverter() required DateTime updatedAt,
  }) = _RegisterShiftDto;

  factory RegisterShiftDto.fromJson(Map<String, dynamic> json) => _$RegisterShiftDtoFromJson(json);
}

// part 'register_shift_dto.g.dart';

// @JsonSerializable()
// class RegisterShiftDto extends Equatable {
//   final String status;
//   @DateTimeConverter()
//   final DateTime createdAt;
//   @DateTimeConverter()
//   final DateTime updatedAt;

//   const RegisterShiftDto({
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   @override
//   List<Object?> get props => [status, createdAt, updatedAt];

//   factory RegisterShiftDto.fromJson(Map<String, dynamic> json) => _$RegisterShiftDtoFromJson(json);

//   RegisterShift toDomain() => RegisterShift(
//         status: status,
//         createdAt: createdAt,
//         updatedAt: updatedAt,
//       );
// }


