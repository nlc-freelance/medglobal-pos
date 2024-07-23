import 'package:json_annotation/json_annotation.dart';

part 'register_shift.g.dart';

@JsonSerializable(includeIfNull: false)
class RegisterShift {
  final int? register;
  final String? status;
  final double? openingAmount;
  final double? closingAmount;

  RegisterShift({
    this.register,
    this.status,
    this.openingAmount,
    this.closingAmount,
  });

  Map<String, dynamic> toJson() => _$RegisterShiftToJson(this);

  RegisterShift copyWith({
    int? register,
    String? status,
    double? openingAmount,
    double? closingAmount,
  }) {
    return RegisterShift(
      register: register ?? this.register,
      status: status ?? this.status,
      openingAmount: openingAmount ?? this.openingAmount,
      closingAmount: closingAmount ?? this.closingAmount,
    );
  }
}
