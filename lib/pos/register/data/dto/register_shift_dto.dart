import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift.dart';

part 'register_shift_dto.g.dart';

@JsonSerializable()
class RegisterShiftDto extends Equatable {
  final String? status;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const RegisterShiftDto({
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  @override
  List<Object?> get props => [status, createdAt, updatedAt];

  factory RegisterShiftDto.fromJson(Map<String, dynamic> json) => _$RegisterShiftDtoFromJson(json);

  RegisterShift toEntity() => RegisterShift(
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
