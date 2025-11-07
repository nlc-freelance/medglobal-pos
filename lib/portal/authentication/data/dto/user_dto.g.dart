// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as int?,
      givenName: json['givenName'] as String?,
      familyName: json['familyName'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'givenName': instance.givenName,
      'familyName': instance.familyName,
      'type': instance.type,
    };
