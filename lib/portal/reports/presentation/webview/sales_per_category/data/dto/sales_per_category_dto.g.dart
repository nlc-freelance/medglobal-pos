// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_per_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPerCategoryDto _$SalesPerCategoryDtoFromJson(Map<String, dynamic> json) =>
    SalesPerCategoryDto(
      productCategory: json['productCategory'] as String?,
      totalItemsSold: json['totalSoldItems'] as int?,
      totalItemsReturned: json['totalReturnedItems'] as int?,
      itemNetCount: json['itemNetCount'] as int?,
      totalSalesAmount: (json['totalSalesAmount'] as num?)?.toDouble(),
      totalReturnedAmount: (json['totalReturnedAmount'] as num?)?.toDouble(),
      totalDiscountAmount: (json['totalDiscountAmount'] as num?)?.toDouble(),
      itemNetSales: (json['itemNetSales'] as num?)?.toDouble(),
      branch: json['branch'] as String?,
      timeVariance: json['timeVariance'] as String?,
    );

Map<String, dynamic> _$SalesPerCategoryDtoToJson(
        SalesPerCategoryDto instance) =>
    <String, dynamic>{
      'productCategory': instance.productCategory,
      'totalSoldItems': instance.totalItemsSold,
      'totalReturnedItems': instance.totalItemsReturned,
      'itemNetCount': instance.itemNetCount,
      'totalSalesAmount': instance.totalSalesAmount,
      'totalReturnedAmount': instance.totalReturnedAmount,
      'totalDiscountAmount': instance.totalDiscountAmount,
      'itemNetSales': instance.itemNetSales,
      'branch': instance.branch,
      'timeVariance': instance.timeVariance,
    };
