import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';

part 'register.g.dart';

@JsonSerializable()
class Register extends Equatable {
  final int? id;
  final String? name;
  final Branch? branch;

  const Register({
    this.id,
    this.name,
    this.branch,
  });

  @override
  List<Object?> get props => [id, name, branch];

  factory Register.fromJson(Map<String, dynamic> json) => _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}
