// part of 'purchase_order_remote_cubit.dart';

// sealed class PurchaseOrderRemoteState extends Equatable {
//   const PurchaseOrderRemoteState();

//   @override
//   List<Object?> get props => [];
// }

// final class PurchaseOrderInitial extends PurchaseOrderRemoteState {}

// /// GetById
// ///
// final class PurchaseOrderByIdSuccess extends PurchaseOrderRemoteState {
//   final PurchaseOrder purchaseOrder;
//   const PurchaseOrderByIdSuccess({required this.purchaseOrder});

//   @override
//   List<Object?> get props => [purchaseOrder];
// }

// /// Create
// ///
// final class PurchaseOrderCreateLoading extends PurchaseOrderRemoteState {}

// final class PurchaseOrderCreateSuccess extends PurchaseOrderRemoteState {
//   final PurchaseOrder purchaseOrder;
//   const PurchaseOrderCreateSuccess({required this.purchaseOrder});

//   @override
//   List<Object?> get props => [purchaseOrder];
// }

// /// Update
// final class PurchaseOrderSuccess extends PurchaseOrderRemoteState {
//   final PurchaseOrder purchaseOrder;
//   const PurchaseOrderSuccess({required this.purchaseOrder});

//   @override
//   List<Object?> get props => [purchaseOrder];
// }

// /// Delete
// final class PurchaseOrderDeleteSuccess extends PurchaseOrderRemoteState {}

// /// Loading
// ///
// final class PurchaseOrderByIdLoading extends PurchaseOrderRemoteState {}

// final class PurchaseOrderSaveLoading extends PurchaseOrderRemoteState {}

// final class PurchaseOrderSaveAndMarkAsShippedLoading extends PurchaseOrderRemoteState {}

// final class PurchaseOrderSaveAndReceivedLoading extends PurchaseOrderRemoteState {}

// final class PurchaseOrderCancelLoading extends PurchaseOrderRemoteState {}

// final class PurchaseOrderDeleteLoading extends PurchaseOrderRemoteState {}

// /// Error
// ///
// final class PurchaseOrderByIdError extends PurchaseOrderRemoteState {
//   final String message;
//   const PurchaseOrderByIdError({required this.message});

//   @override
//   List<Object?> get props => [message];
// }

// final class PurchaseOrderError extends PurchaseOrderRemoteState {
//   final String message;
//   const PurchaseOrderError({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
