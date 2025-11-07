// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_inventory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchInventoryDtoImpl _$$BranchInventoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchInventoryDtoImpl(
      id: json['id'] as int,
      store: BranchPartialDto.fromJson(json['store'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      currentStock: json['currentStock'] as int,
    );

Map<String, dynamic> _$$BranchInventoryDtoImplToJson(
        _$BranchInventoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
      'price': instance.price,
      'currentStock': instance.currentStock,
    };
