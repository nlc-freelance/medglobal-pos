part of 'purchase_order_bloc.dart';

@freezed
class PurchaseOrderState with _$PurchaseOrderState {
  const factory PurchaseOrderState.initial() = _Initial;
  const factory PurchaseOrderState.loading() = _Loading;
  const factory PurchaseOrderState.loaded(PurchaseOrder po) = _Loaded;
  const factory PurchaseOrderState.loadFailed(String message) = _LoadFailed;

  const factory PurchaseOrderState.creating() = _Creating;
  const factory PurchaseOrderState.saving() = _Saving;
  const factory PurchaseOrderState.markingAsShippedWithNewItems() = _MarkingAsShippedWithNewItems;
  const factory PurchaseOrderState.markingAsShipped() = _MarkingAsShipped;
  const factory PurchaseOrderState.markingAsReceived() = _MarkingAsReceived;
  const factory PurchaseOrderState.success(PurchaseOrder po) = _Success;

  const factory PurchaseOrderState.cancelling() = _Cancelling;
  const factory PurchaseOrderState.cancelled() = _Cancelled;

  const factory PurchaseOrderState.deleting() = _Deleting;
  const factory PurchaseOrderState.deleted() = _Deleted;

  const factory PurchaseOrderState.failure(String message) = _Failure;
}
