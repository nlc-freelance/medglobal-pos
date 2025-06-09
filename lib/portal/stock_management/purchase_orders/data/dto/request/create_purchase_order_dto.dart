import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';

part 'create_purchase_order_dto.g.dart';

@JsonSerializable()
class CreatePurchaseOrderDto {
  final int? branchId;
  final int? supplierId;
  final bool? isAutoFill;

  CreatePurchaseOrderDto({
    this.branchId,
    this.supplierId,
    this.isAutoFill = false,
  });

  Map<String, dynamic> toJson() => _$CreatePurchaseOrderDtoToJson(this);

  factory CreatePurchaseOrderDto.fromDomain(NewPurchaseOrder po) => CreatePurchaseOrderDto(
        branchId: po.branchId,
        supplierId: po.supplierId,
        isAutoFill: po.isAutoFill,
      );
}
