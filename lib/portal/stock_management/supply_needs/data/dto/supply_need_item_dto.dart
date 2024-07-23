import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';

part 'supply_need_item_dto.g.dart';

@JsonSerializable()
class SupplyNeedItemDto extends Equatable {
  final int? id;
  @JsonKey(name: 'storeId')
  final int? branchId;
  final ProductVariantDto? variant;
  @JsonKey(name: 'currentStock')
  final int? qty;

  const SupplyNeedItemDto({this.id, this.branchId, this.variant, this.qty});

  @override
  List<Object?> get props => [id, branchId, variant, qty];

  factory SupplyNeedItemDto.fromJson(Map<String, dynamic> json) => _$SupplyNeedItemDtoFromJson(json);

  SupplyNeed toEntity(Branch? branch) => SupplyNeed(
        id: id,
        branch: branch,
        variantName: '${variant?.product?.name} ${variant?.name}',
        sku: variant?.sku,
        qty: qty,
        warningStock: variant?.warningStock ?? 0,
        idealStock: variant?.idealStock ?? 0,
        suppliers: const [],
      );
}
