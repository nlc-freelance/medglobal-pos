// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_stock_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewStockTransfer _$NewStockTransferFromJson(Map<String, dynamic> json) =>
    NewStockTransfer(
      fromBranch: json['fromBranch'] as int?,
      toBranch: json['toBranch'] as int?,
      isAutoFill: json['isAutoFill'] as bool? ?? false,
    );

Map<String, dynamic> _$NewStockTransferToJson(NewStockTransfer instance) =>
    <String, dynamic>{
      'fromBranch': instance.fromBranch,
      'toBranch': instance.toBranch,
      'isAutoFill': instance.isAutoFill,
    };
