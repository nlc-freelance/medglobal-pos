// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'new_purchase_order.g.dart';

// @JsonSerializable()
// class NewPurchaseOrder {
//   final int? branchId;
//   final int? supplierId;
//   final bool? isAutoFill;

//   NewPurchaseOrder({
//     this.branchId,
//     this.supplierId,
//     this.isAutoFill = false,
//   });

//   Map<String, dynamic> toJson() => _$NewPurchaseOrderToJson(this);

//   NewPurchaseOrder copyWith({
//     int? branchId,
//     int? supplierId,
//     bool? isAutoFill,
//   }) {
//     return NewPurchaseOrder(
//       branchId: branchId ?? this.branchId,
//       supplierId: supplierId ?? this.supplierId,
//       isAutoFill: isAutoFill ?? this.isAutoFill,
//     );
//   }

//   @override
//   String toString() {
//     return 'NewPurchaseOrder{branchId: $branchId, supplierId: $supplierId, isAutoFill: $isAutoFill}';
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_purchase_order.freezed.dart';

@freezed
class NewPurchaseOrder with _$NewPurchaseOrder {
  const factory NewPurchaseOrder({
    int? branchId,
    int? supplierId,
    @Default(false) bool isAutoFill,
  }) = _NewPurchaseOrder;
}
