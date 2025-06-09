part of 'purchase_order_bloc.dart';

@freezed
class PurchaseOrderEvent with _$PurchaseOrderEvent {
  const factory PurchaseOrderEvent.getPurchaseOrderById(int id) = _GetPurchaseOrderById;
  const factory PurchaseOrderEvent.createPurchaseOrder(NewPurchaseOrder po) = _CreatePurchaseOrder;
  const factory PurchaseOrderEvent.updatePurchaseOrder({
    required UpdatePurchaseOrder action,
    required int id,
    required PurchaseOrder purchaseOrder,
  }) = _UpdatePurchaseOrder;
  const factory PurchaseOrderEvent.cancelPurchaseOrder(int id) = _CancelPurchaseOrder;
  const factory PurchaseOrderEvent.deletePurchaseOrder(int id) = _DeletePurchaseOrder;
}
