part of 'purchase_order_form_cubit.dart';

@freezed
class PurchaseOrderFormState with _$PurchaseOrderFormState {
  const factory PurchaseOrderFormState({
    required PurchaseOrder purchaseOrder,
  }) = _PurchaseOrderFormState;

  const PurchaseOrderFormState._();

  factory PurchaseOrderFormState.initial() => const PurchaseOrderFormState(purchaseOrder: PurchaseOrder());
}
