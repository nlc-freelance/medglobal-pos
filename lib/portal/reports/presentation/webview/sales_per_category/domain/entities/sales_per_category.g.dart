// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_per_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesPerCategory _$SalesPerCategoryFromJson(Map<String, dynamic> json) =>
    SalesPerCategory(
      productCategory: json['productCategory'] as String?,
      totalItemsSold: json['totalItemsSold'] as int?,
      totalItemsReturned: json['totalItemsReturned'] as int?,
      itemNetCount: json['itemNetCount'] as int?,
      totalSalesAmount: (json['totalSalesAmount'] as num?)?.toDouble(),
      totalReturnedAmount: (json['totalReturnedAmount'] as num?)?.toDouble(),
      totalDiscountAmount: (json['totalDiscountAmount'] as num?)?.toDouble(),
      itemNetSales: (json['itemNetSales'] as num?)?.toDouble(),
      branch: json['branch'] as String?,
      timeVariance: json['timeVariance'] as String?,
    );

Map<String, dynamic> _$SalesPerCategoryToJson(SalesPerCategory instance) =>
    <String, dynamic>{
      'productCategory': instance.productCategory,
      'totalItemsSold': instance.totalItemsSold,
      'totalItemsReturned': instance.totalItemsReturned,
      'itemNetCount': instance.itemNetCount,
      'totalSalesAmount': instance.totalSalesAmount,
      'totalReturnedAmount': instance.totalReturnedAmount,
      'totalDiscountAmount': instance.totalDiscountAmount,
      'itemNetSales': instance.itemNetSales,
      'branch': instance.branch,
      'timeVariance': instance.timeVariance,
    };
