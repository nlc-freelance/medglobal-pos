import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'register_shift.g.dart';

@JsonSerializable()
class RegisterShift extends Equatable {
  final String status;
  @DateTimeConverter()
  final DateTime createdAt;
  @DateTimeConverter()
  final DateTime updatedAt;

  const RegisterShift({
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [status, createdAt, updatedAt];

  factory RegisterShift.fromJson(Map<String, dynamic> json) => _$RegisterShiftFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterShiftToJson(this);
}
