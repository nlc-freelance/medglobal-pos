// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_sale_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductSaleHistoryItemDtoImpl _$$ProductSaleHistoryItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductSaleHistoryItemDtoImpl(
      saleTransactionId: json['saleTransactionId'] as int,
      transactionDateTime: const DateTimeConverter()
          .fromJson(json['transactionDateTime'] as String),
      transactionType: json['transactionType'] as String,
      unitCost: (json['unitCost'] as num).toDouble(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      volumeSold: json['volumeSold'] as int,
      grossSales: (json['grossSales'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      netSales: (json['netSales'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductSaleHistoryItemDtoImplToJson(
        _$ProductSaleHistoryItemDtoImpl instance) =>
    <String, dynamic>{
      'saleTransactionId': instance.saleTransactionId,
      'transactionDateTime':
          const DateTimeConverter().toJson(instance.transactionDateTime),
      'transactionType': instance.transactionType,
      'unitCost': instance.unitCost,
      'sellingPrice': instance.sellingPrice,
      'volumeSold': instance.volumeSold,
      'grossSales': instance.grossSales,
      'discount': instance.discount,
      'netSales': instance.netSales,
    };
