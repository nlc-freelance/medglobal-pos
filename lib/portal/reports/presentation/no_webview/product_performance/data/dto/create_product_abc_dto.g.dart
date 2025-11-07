// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_abc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductABCDto _$CreateProductABCDtoFromJson(Map<String, dynamic> json) =>
    CreateProductABCDto(
      branchId: json['branchId'] as int,
      productCategoryIds: (json['productCategoryIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      rankingCriteria: json['rankingCriteria'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$CreateProductABCDtoToJson(
        CreateProductABCDto instance) =>
    <String, dynamic>{
      'branchId': instance.branchId,
      'productCategoryIds': instance.productCategoryIds,
      'rankingCriteria': instance.rankingCriteria,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
