// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_need_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyNeedDto _$SupplyNeedDtoFromJson(Map<String, dynamic> json) =>
    SupplyNeedDto(
      id: json['id'] as int?,
      branch: json['branch'] == null
          ? null
          : BranchPartialDto.fromJson(json['branch'] as Map<String, dynamic>),
      items: (json['productList'] as List<dynamic>?)
          ?.map((e) => SupplyNeedItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupplyNeedDtoToJson(SupplyNeedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'productList': instance.items,
    };
