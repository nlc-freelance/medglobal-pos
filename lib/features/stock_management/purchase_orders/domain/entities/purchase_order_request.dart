import 'package:json_annotation/json_annotation.dart';

part 'purchase_order_request.g.dart';

@JsonSerializable()
class PurchaseOrderRequest {
  final int? branchId;
  final int? supplierId;
  final bool? isAutoFill;

  PurchaseOrderRequest({
    this.branchId,
    this.supplierId,
    this.isAutoFill = false,
  });

  Map<String, dynamic> toJson() => _$PurchaseOrderRequestToJson(this);

  PurchaseOrderRequest copyWith({
    int? branchId,
    int? supplierId,
    bool? isAutoFill,
  }) {
    return PurchaseOrderRequest(
      branchId: branchId ?? this.branchId,
      supplierId: supplierId ?? this.supplierId,
      isAutoFill: isAutoFill ?? this.isAutoFill,
    );
  }
}
