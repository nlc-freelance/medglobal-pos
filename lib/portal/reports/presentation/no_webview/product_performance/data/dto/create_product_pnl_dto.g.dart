// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_pnl_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductPNLDto _$CreateProductPNLDtoFromJson(Map<String, dynamic> json) =>
    CreateProductPNLDto(
      branchId: json['branchId'] as int,
      productCategoryIds: (json['productCategoryIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      topSize: json['topSize'] as int,
      rankingCriteria: json['rankingCriteria'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$CreateProductPNLDtoToJson(
        CreateProductPNLDto instance) =>
    <String, dynamic>{
      'branchId': instance.branchId,
      'productCategoryIds': instance.productCategoryIds,
      'topSize': instance.topSize,
      'rankingCriteria': instance.rankingCriteria,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
