// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';

// part 'purchase_order_state.dart';

// class PurchaseOrderCubit extends Cubit<PurchaseOrderState> {
//   PurchaseOrderCubit() : super(PurchaseOrderState.initial());

//   void reset() => emit(PurchaseOrderState.initial());

//   void setPurchaseOrder(PurchaseOrder purchaseOrder) => emit(PurchaseOrderState(purchaseOrder));

//   void setEstimatedDateOfArrival(DateTime value) =>
//       emit(PurchaseOrderState(state.purchaseOrder.copyWith(estimatedDateOfArrival: value)));

//   void setQuantityToOrderPerItem({required int id, int? qty, required double total}) {
//     final items = state.purchaseOrder.items?.toList() ?? [];

//     final updatedItems = items.map((item) {
//       if (item.id == id) {
//         return item.copyWith(
//           nullQtyToOrder: qty == null,
//           qtyToOrder: qty,
//           total: total.roundToTwoDecimalPlaces(),
//         );
//       }
//       return item;
//     }).toList();

//     emit(PurchaseOrderState(state.purchaseOrder.copyWith(items: updatedItems)));
//   }

//   void setSupplierPricePerItem({required int id, double? price, required double total}) {
//     final items = state.purchaseOrder.items?.toList() ?? [];

//     final updatedItems = items.map((item) {
//       if (item.id == id) {
//         return item.copyWith(
//           nullSupplierPrice: price == null,
//           supplierPrice: price,
//           total: total.roundToTwoDecimalPlaces(),
//         );
//       }
//       return item;
//     }).toList();

//     emit(PurchaseOrderState(state.purchaseOrder.copyWith(items: updatedItems)));
//   }

//   void setQuantityReceivedPerItem({required int id, int? qty, required double total}) {
//     final items = state.purchaseOrder.items?.toList() ?? [];

//     final updatedItems = items.map((item) {
//       if (item.id == id) {
//         return item.copyWith(
//           nullQtyReceived: qty == null,
//           qtyReceived: qty,
//           total: total.roundToTwoDecimalPlaces(),
//         );
//       }
//       return item;
//     }).toList();

//     emit(PurchaseOrderState(state.purchaseOrder.copyWith(items: updatedItems)));
//   }

//   void addItem(PurchaseOrderItem value) {
//     final purchaseOrderItems = state.purchaseOrder.items?.toList() ?? [];
//     final updatedPurchaseOrderItems = [...purchaseOrderItems, value];

//     emit(PurchaseOrderState(state.purchaseOrder.copyWith(items: updatedPurchaseOrderItems)));
//   }

//   void removeItem(int id) {
//     final purchaseOrderItems = state.purchaseOrder.items?.toList() ?? [];
//     purchaseOrderItems.removeWhere((variant) => variant.id == id);

//     emit(PurchaseOrderState(state.purchaseOrder.copyWith(items: purchaseOrderItems)));
//   }

//   void setTax(double value) => emit(PurchaseOrderState(state.purchaseOrder.copyWith(tax: value)));

//   void setDiscount(double value) =>
//       emit(PurchaseOrderState(state.purchaseOrder.copyWith(discount: value.roundToTwoDecimalPlaces())));

//   void setTotal(double value) {
//     emit(PurchaseOrderState(state.purchaseOrder.copyWith(totalAmount: value)));
//   }

//   void setNotes(String value) => emit(PurchaseOrderState(state.purchaseOrder.copyWith(notes: value)));
// }
