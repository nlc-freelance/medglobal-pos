import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/data/supply_need_item_dto.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/supply_need.dart';

part 'supply_need_dto.g.dart';

@JsonSerializable()
class SupplyNeedDto extends Equatable {
  final int? id;
  final Branch? branch;
  final List<SupplyNeedItemDto>? items;

  const SupplyNeedDto({
    this.id,
    this.branch,
    this.items,
  });

  @override
  List<Object?> get props => [id, branch, items];

  factory SupplyNeedDto.fromJson(Map<String, dynamic> json) => _$SupplyNeedDtoFromJson(json);

  List<SupplyNeed> toEntity() =>
      items
          ?.map((item) => SupplyNeed(
                id: id,
                branch: branch,
                variantName: '${item.variant?.product?.name} ${item.variant?.name}',
                sku: item.variant?.sku,
                qty: item.qty,
                warningStock: item.variant?.warningStock ?? 0,
                idealStock: item.variant?.idealStock ?? 0,
                // suppliers: item.variant?.suppliers ?? [],
              ))
          .toList() ??
      [];
}
