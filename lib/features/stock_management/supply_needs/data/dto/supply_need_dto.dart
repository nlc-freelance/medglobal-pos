import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/data/dto/supply_need_item_dto.dart';

part 'supply_need_dto.g.dart';

@JsonSerializable()
class SupplyNeedDto extends Equatable {
  final int? id;
  final Branch? branch;
  @JsonKey(name: 'productList')
  final List<SupplyNeedItemDto>? items;

  const SupplyNeedDto({
    this.id,
    this.branch,
    this.items,
  });

  @override
  List<Object?> get props => [id, branch, items];

  factory SupplyNeedDto.fromJson(Map<String, dynamic> json) => _$SupplyNeedDtoFromJson(json);
}
