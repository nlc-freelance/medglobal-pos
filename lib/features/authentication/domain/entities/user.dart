import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String? firstName;
  final String? lastName;

  const User({
    this.firstName,
    this.lastName,
  });

  @override
  List<Object?> get props => [firstName, lastName];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
