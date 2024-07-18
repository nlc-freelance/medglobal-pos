import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/variant_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/variants/product_variant_dto.dart';

part 'supply_need_item_dto.g.dart';

@JsonSerializable()
class SupplyNeedItemDto extends Equatable {
  final int? id;
  final ProductVariantDto? variant;
  @JsonKey(name: 'currentStock')
  final int? qty;

  const SupplyNeedItemDto({this.id, this.variant, this.qty});

  @override
  List<Object?> get props => [id, variant, qty];

  factory SupplyNeedItemDto.fromJson(Map<String, dynamic> json) => _$SupplyNeedItemDtoFromJson(json);
}
