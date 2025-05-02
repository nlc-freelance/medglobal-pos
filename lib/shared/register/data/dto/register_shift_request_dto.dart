import 'package:json_annotation/json_annotation.dart';

part 'register_shift_request_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class RegisterShiftRequestDto {
  final int register;
  final String status;
  final double? openingAmount;
  final double? closingAmount;

  const RegisterShiftRequestDto({
    required this.register,
    required this.status,
    this.openingAmount,
    this.closingAmount,
  });

  Map<String, dynamic> toJson() => _$RegisterShiftRequestDtoToJson(this);
}
