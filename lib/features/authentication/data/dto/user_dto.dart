import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/entities/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends Equatable {
  final int? id;

  final String? givenName;
  final String? familyName;

  const UserDto({
    this.id,
    this.givenName,
    this.familyName,
  });

  @override
  List<Object?> get props => [
        id,
        givenName,
        familyName,
      ];

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  User toEntity() => User(
        firstName: givenName,
        lastName: familyName,
      );
}
