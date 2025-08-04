import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_shift.freezed.dart';
part 'register_shift.g.dart';

@freezed
class RegisterShift with _$RegisterShift {
  const factory RegisterShift({
    int? id,
    @Default('close') String status,
    double? openingAmount,
    double? closingAmount,
    DateTime? openedAt,
    DateTime? closedAt,
    DateTime? createdAt,
    required int userId,
    required int registerId,
  }) = _RegisterShift;

  factory RegisterShift.fromJson(Map<String, dynamic> json) => _$RegisterShiftFromJson(json);
}

extension RegisterShiftPayloadExt on RegisterShift {
  Map<String, dynamic> toOpenPayload() {
    return {
      'register': registerId,
      'status': status,
      'openingAmount': openingAmount,
      'updateTimestamp': openedAt?.toIso8601String(),
    };
  }

  Map<String, dynamic> toClosePayload() {
    return {
      'register': registerId,
      'status': status,
      'closingAmount': closingAmount,
      'updateTimestamp': openedAt?.toIso8601String(),
    };
  }
}
