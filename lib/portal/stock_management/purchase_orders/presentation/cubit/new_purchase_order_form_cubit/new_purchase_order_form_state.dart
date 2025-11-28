part of 'new_purchase_order_form_cubit.dart';

@freezed
class NewPurchaseOrderFormState with _$NewPurchaseOrderFormState {
  const factory NewPurchaseOrderFormState({
    int? branchId,
    int? supplierId,
    @Default(false) bool isAutoFill,
  }) = _NewPurchaseOrderFormState;

  const NewPurchaseOrderFormState._();

  factory NewPurchaseOrderFormState.initial() => const NewPurchaseOrderFormState();
}
