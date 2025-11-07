// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      isFirstTimeLogin: json['isFirstTimeLogin'] as bool? ?? false,
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseDtoToJson(LoginResponseDto instance) =>
    <String, dynamic>{
      'isFirstTimeLogin': instance.isFirstTimeLogin,
      'isLoggedIn': instance.isLoggedIn,
      'token': instance.token,
      'user': instance.user,
    };
