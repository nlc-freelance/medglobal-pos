part of 'purchase_order_list_cubit.dart';

sealed class PurchaseOrderListState extends Equatable {
  const PurchaseOrderListState();

  @override
  List<Object> get props => [];
}

final class PurchaseOrderListInitial extends PurchaseOrderListState {}

final class PurchaseOrderListLoading extends PurchaseOrderListState {}

final class PurchaseOrderListLoaded extends PurchaseOrderListState {
  final List<PurchaseOrder> purchaseOrders;
  const PurchaseOrderListLoaded({required this.purchaseOrders});

  @override
  List<Object> get props => [purchaseOrders];
}

final class PurchaseOrderListError extends PurchaseOrderListState {
  final String message;
  const PurchaseOrderListError({required this.message});

  @override
  List<Object> get props => [message];
}
