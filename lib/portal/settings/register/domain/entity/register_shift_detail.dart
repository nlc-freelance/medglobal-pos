import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'register_shift_detail.g.dart';

@JsonSerializable()
class RegisterShiftDetail extends Equatable {
  final String status;
  @DateTimeConverter()
  final DateTime createdAt;
  @DateTimeConverter()
  final DateTime updatedAt;

  const RegisterShiftDetail({
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [status, createdAt, updatedAt];

  factory RegisterShiftDetail.fromJson(Map<String, dynamic> json) => _$RegisterShiftDetailFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterShiftDetailToJson(this);
}
