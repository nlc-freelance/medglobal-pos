import 'package:json_annotation/json_annotation.dart';

part 'register_shift_payload.g.dart';

@JsonSerializable(includeIfNull: false)
class RegisterShiftPayload {
  final int register;
  final String status;
  final double? openingAmount;
  final double? closingAmount;

  const RegisterShiftPayload({
    required this.register,
    required this.status,
    this.openingAmount,
    this.closingAmount,
  });

  Map<String, dynamic> toJson() => _$RegisterShiftPayloadToJson(this);
}
