// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supply_need.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplyNeed _$SupplyNeedFromJson(Map<String, dynamic> json) => SupplyNeed(
      id: json['id'] as int?,
      branch: json['branch'] == null
          ? null
          : BranchPartial.fromJson(json['branch'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SupplyNeedItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SupplyNeedToJson(SupplyNeed instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch': instance.branch,
      'items': instance.items,
    };
