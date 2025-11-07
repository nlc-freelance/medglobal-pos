// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_return_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReturnDto _$UpdateReturnDtoFromJson(Map<String, dynamic> json) =>
    UpdateReturnDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => UpdateReturnItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpdateReturnDtoToJson(UpdateReturnDto instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
