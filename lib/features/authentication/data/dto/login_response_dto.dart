import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/authentication/data/dto/user_dto.dart';
import 'package:medglobal_admin_portal/features/authentication/domain/entities/login_response.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto extends Equatable {
  final bool? isFirstTimeLogin;
  final bool? isLoggedIn;
  final String? token;
  final UserDto? user;

  const LoginResponseDto({
    this.isFirstTimeLogin = false,
    this.isLoggedIn = false,
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [
        isFirstTimeLogin,
        isLoggedIn,
        token,
        user,
      ];

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  LoginResponse toEntity() => LoginResponse(
        isFirstTimeLogin: isFirstTimeLogin,
        isLoggedIn: isLoggedIn,
        token: token,
        user: user?.toEntity(),
      );
}
