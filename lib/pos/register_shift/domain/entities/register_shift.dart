import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_shift.freezed.dart';
part 'register_shift.g.dart';

@freezed
class RegisterShift with _$RegisterShift {
  const factory RegisterShift({
    int? id,
    @Default('open') String status,
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
      'status': 'open',
      'openingAmount': openingAmount,
      'updateTimestamp': openedAt?.millisecondsSinceEpoch,
    };
  }

  Map<String, dynamic> toClosePayload() {
    return {
      'register': registerId,
      'status': 'close',
      'closingAmount': closingAmount,
      'updateTimestamp': openedAt?.millisecondsSinceEpoch,
    };
  }
}
