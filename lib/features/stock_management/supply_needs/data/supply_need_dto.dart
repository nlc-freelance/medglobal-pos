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
  final List<SupplyNeedItemDto>? products;

  const SupplyNeedDto({
    this.id,
    this.branch,
    this.products,
  });

  @override
  List<Object?> get props => [id, branch, products];

  factory SupplyNeedDto.fromJson(Map<String, dynamic> json) => _$SupplyNeedDtoFromJson(json);

  List<SupplyNeed> toEntity() =>
      products
          ?.map((product) => SupplyNeed(
                id: id,
                branch: branch,
                variantName: '${product.variant?.product?.name} ${product.variant?.name}',
                sku: product.variant?.sku,
                qty: product.qty,
                warningStock: product.variant?.warningStock ?? 0,
                idealStock: product.variant?.idealStock ?? 0,
                suppliers: product.variant?.suppliers ?? [],
              ))
          .toList() ??
      [];
}
