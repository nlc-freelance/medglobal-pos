import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'register_shift.g.dart';

@JsonSerializable(includeIfNull: false)
class RegisterShift extends Equatable {
  final int? register;
  final String? status;
  final double? openingAmount;
  final double? closingAmount;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const RegisterShift({
    this.register,
    this.status,
    this.openingAmount,
    this.closingAmount,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [register, status, openingAmount, closingAmount, createdAt, updatedAt];

  factory RegisterShift.fromJson(Map<String, dynamic> json) => _$RegisterShiftFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterShiftToJson(this);

  RegisterShift copyWith({
    int? register,
    String? status,
    double? openingAmount,
    double? closingAmount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RegisterShift(
      register: register ?? this.register,
      status: status ?? this.status,
      openingAmount: openingAmount ?? this.openingAmount,
      closingAmount: closingAmount ?? this.closingAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
