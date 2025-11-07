// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_stock_take.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewStockTake _$NewStockTakeFromJson(Map<String, dynamic> json) => NewStockTake(
      branch: json['branch'] as int?,
      supplier: json['supplier'] as int?,
      isAllSupplier: json['isAllSupplier'] as bool? ?? false,
    );

Map<String, dynamic> _$NewStockTakeToJson(NewStockTake instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'supplier': instance.supplier,
      'isAllSupplier': instance.isAllSupplier,
    };
