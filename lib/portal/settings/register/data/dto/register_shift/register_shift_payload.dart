// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
//
// part 'register_shift_payload.g.dart';
//
// @JsonSerializable(includeIfNull: false)
// class RegisterShiftPayload {
//   final int register;
//   final String status;
//   final double? openingAmount;
//   final double? closingAmount;
//   @EpochMillisecondsConverter()
//   final DateTime updateTimestamp;
//
//   const RegisterShiftPayload({
//     required this.register,
//     required this.status,
//     this.openingAmount,
//     this.closingAmount,
//     required this.updateTimestamp,
//   });
//
//   Map<String, dynamic> toJson() => _$RegisterShiftPayloadToJson(this);
// }
