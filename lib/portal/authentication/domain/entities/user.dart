import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final UserType? type;

  const User({
    this.id,
    this.firstName,
    this.lastName,
    this.type,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, type];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
