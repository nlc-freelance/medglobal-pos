part of 'purchase_order_list_remote_cubit.dart';

sealed class PurchaseOrderListRemoteState extends Equatable {
  const PurchaseOrderListRemoteState();

  @override
  List<Object> get props => [];
}

final class PurchaseOrderListInitial extends PurchaseOrderListRemoteState {}

final class PurchaseOrderListLoading extends PurchaseOrderListRemoteState {}

final class PurchaseOrderListLoaded extends PurchaseOrderListRemoteState {
  final List<PurchaseOrder> purchaseOrders;
  const PurchaseOrderListLoaded({required this.purchaseOrders});

  @override
  List<Object> get props => [purchaseOrders];
}

final class PurchaseOrderListError extends PurchaseOrderListRemoteState {
  final String message;
  const PurchaseOrderListError({required this.message});

  @override
  List<Object> get props => [message];
}
