import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends Equatable {
  final int? id;
  final String? givenName;
  final String? familyName;
  final String? type;

  const UserDto({
    this.id,
    this.givenName,
    this.familyName,
    this.type,
  });

  @override
  List<Object?> get props => [
        id,
        givenName,
        familyName,
        type,
      ];

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  User toEntity() => User(
        id: id,
        firstName: givenName,
        lastName: familyName,

        /// If cashier, proceed as POS, if admin proceed to Portal
        type: mapUserType(),
      );

  UserType? mapUserType() {
    switch (type) {
      case 'cashier':
        return UserType.CASHIER;
      case 'admin':
        return UserType.ADMIN;
      default:
        return null;
    }
  }
}
