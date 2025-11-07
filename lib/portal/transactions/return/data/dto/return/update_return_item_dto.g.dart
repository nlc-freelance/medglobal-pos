// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_return_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateReturnItemDto _$UpdateReturnItemDtoFromJson(Map<String, dynamic> json) =>
    UpdateReturnItemDto(
      id: json['id'] as int,
      writeOffQuantity: json['writeOffQuantity'] as int?,
      restockQuantity: json['restockQuantity'] as int?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$UpdateReturnItemDtoToJson(
        UpdateReturnItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'writeOffQuantity': instance.writeOffQuantity,
      'restockQuantity': instance.restockQuantity,
      'comment': instance.comment,
    };
