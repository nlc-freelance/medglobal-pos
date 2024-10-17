import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';

part 'register.g.dart';

@JsonSerializable()
class Register extends Equatable {
  final int? id;
  final String? name;
  final Branch? branch;
  final RegisterShift? shiftDetail;
  final String? serialNumber;

  const Register({
    this.id,
    this.name,
    this.branch,
    this.shiftDetail,
    this.serialNumber,
  });

  @override
  List<Object?> get props => [id, name, branch, shiftDetail, serialNumber];

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
