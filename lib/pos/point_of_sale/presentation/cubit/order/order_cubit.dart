// import 'package:equatable/equatable.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
// import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction_item.dart';

// part 'order_cubit.g.dart';
// part 'cart_state.dart';

// class OrderCubit extends HydratedCubit<CartState> {
//   OrderCubit() : super(CartState.initial());

//   void setNewOrder(Transaction order) => emit(CartState(order));

//   void addItem(TransactionItem value) {
//     final orderItems = state.order.items?.toList() ?? [];

//     /// check if item is already in order.items, if yes increment qty, else add and set qty to 1
//     List<TransactionItem> updatedItems;
//     if (orderItems.any((item) => item.itemId == value.itemId)) {
//       updatedItems = orderItems.map((item) {
//         if (item.itemId == value.itemId) return item.copyWith(qty: item.qty! + 1);
//         return item;
//       }).toList();
//     } else {
//       updatedItems = [...orderItems, value.copyWith(qty: 1)];
//     }

//     emit(
//       CartState(
//         state.order.copyWith(items: _updateDiscountAndTotalPerItem(updatedItems)),
//       ),
//     );
//   }

//   void removeItem(int id) {
//     final items = state.order.items?.toList() ?? [];
//     items.removeWhere((item) => item.id == id);

//     emit(
//       CartState(
//         state.order.copyWith(items: _updateDiscountAndTotalPerItem(items)),
//       ),
//     );
//   }

//   void setQtyPerItem({required int id, int? qty}) {
//     final items = state.order.items?.toList() ?? [];

//     /// If quantity entered is 0, remove from list
//     if (qty == 0) {
//       removeItem(id);
//     } else {
//       final updatedItems = items.map((item) {
//         if (item.id == id) {
//           return item.copyWith(qty: qty);
//         }
//         return item;
//       }).toList();

//       emit(
//         CartState(
//           state.order.copyWith(items: _updateDiscountAndTotalPerItem(updatedItems)),
//         ),
//       );
//     }
//   }

//   void setDiscountPerItem({required int id, double? discount, required DiscountCategory discountCategory}) {
//     final items = state.order.items?.toList() ?? [];

//     final updatedItems = items.map((item) {
//       if (item.id == id) {
//         /// Compute discounted price per item
//         double? discountedPrice = 0;
//         double? discountInPeso = 0;
//         if (discount != null) {
//           discountInPeso = (item.price! * (discount / 100));
//           discountedPrice = item.price! - discountInPeso;
//         }

//         return item.copyWith(
//           discount: discount,
//           discountedPrice: discountedPrice.roundToTwoDecimalPlaces(),
//           discountCategory: discountCategory,
//           discountType: DiscountType.PERCENT,
//         );
//       }
//       return item;
//     }).toList();

//     emit(
//       CartState(
//         state.order.copyWith(items: _updateDiscountAndTotalPerItem(updatedItems)),
//       ),
//     );
//   }

//   void removeDiscountPerItem(int id) {
//     final items = state.order.items?.toList() ?? [];

//     final updatedItems = items.map((item) {
//       if (item.id == id) {
//         return item.copyWith(removeDiscount: true);
//       }
//       return item;
//     }).toList();

//     emit(
//       CartState(
//         state.order.copyWith(items: _updateDiscountAndTotalPerItem(updatedItems)),
//       ),
//     );
//   }

//   void computeOrderBill() {
//     final items = state.order.items ?? [];

//     final subtotal = items.fold(0.0, (subtotal, item) => subtotal + item.subtotalPerItem).roundToTwoDecimalPlaces();
//     final total = items.fold(0.0, (total, item) => total + item.totalPerItem).roundToTwoDecimalPlaces();
//     final totalDiscount =
//         items.fold(0.0, (totalDiscount, item) => totalDiscount + (item.discountInPeso ?? 0)).roundToTwoDecimalPlaces();

//     emit(
//       CartState(
//         state.order.copyWith(
//           subtotal: subtotal,
//           totalDiscountInPeso: totalDiscount,
//           total: total,
//         ),
//       ),
//     );
//   }

//   void reset() => emit(const CartState(Transaction()));

//   List<TransactionItem> _updateDiscountAndTotalPerItem(List<TransactionItem> items) {
//     return items.map((item) {
//       double? discountInPesoPerItem = 0;
//       if (item.discount != null) {
//         discountInPesoPerItem = (item.price! * (item.discount! / 100));
//       }

//       return item.copyWith(
//         /// Total discount per item
//         discountInPeso: discountInPesoPerItem * item.qty!,
//         total: item.totalPerItem,
//       );
//     }).toList();
//   }

//   @override
//   CartState? fromJson(Map<String, dynamic> json) => CartState.fromJson(json);

//   @override
//   Map<String, dynamic>? toJson(CartState state) => state.toJson();

// // void setDiscountTypePerItem({required int id, required DiscountType type}) {
// //   final items = state.order.items?.toList() ?? [];
// //
// //   /// Update discounted price per item on toggle of discount type
// //   final updatedItems = items.map((item) {
// //     if (item.id == id) {
// //       double? discountedPrice = 0;
// //       if (item.discount != null) {
// //         if (type == DiscountType.PERCENT) discountedPrice = item.price! - (item.price! * (item.discount! / 100));
// //         if (type == DiscountType.PESO) discountedPrice = item.price! - item.discount!;
// //       }
// //       return item.copyWith(discountType: type, discountedPrice: roundToTwoDecimalPlaces(discountedPrice));
// //     }
// //     return item;
// //   }).toList();
// //
// //   emit(CartState(state.order.copyWith(items: updatedItems, subtotal: computeSubtotal(updatedItems))));
// // }

// // void setDiscount({double? discount, required DiscountType type}) {
// //   final order = state.order;
// //
// //   /// Compute discount in peso for the total bill
// //   double? discountInPeso = 0;
// //   if (discount != null) {
// //     if (type == DiscountType.PERCENT) discountInPeso = order.subtotal! * (discount / 100);
// //     if (type == DiscountType.PESO) discountInPeso = discount;
// //   }
// //
// //   emit(CartState(state.order.copyWith(
// //     discount: discount,
// //     discountType: type,
// //     discountInPeso: discountInPeso,
// //   )));
// // }

// // void setDiscountType(DiscountType type) {
// //   final order = state.order;
// //
// //   /// Compute discount in peso
// //   double? discountInPeso = 0;
// //   if (order.discount != null) {
// //     if (type == DiscountType.PERCENT) discountInPeso = order.subtotal! * (order.discount! / 100);
// //     if (type == DiscountType.PESO) discountInPeso = order.discount!;
// //   }
// //
// //   emit(CartState(state.order.copyWith(
// //     discountType: type,
// //     discountInPeso: discountInPeso,
// //   )));
// // }

// // void computeDiscountInPeso() {
// //   final order = state.order;
// //
// //   double discountInPeso = 0;
// //   if (order.discount != null) {
// //     if (order.discountType == DiscountType.PERCENT) discountInPeso = order.subtotal! * (order.discount! / 100);
// //     if (order.discountType == DiscountType.PESO) discountInPeso = order.discount!;
// //   }
// //
// //   emit(CartState(
// //       state.order.copyWith(discountInPeso: discountInPeso, discount: discountInPeso == 0 ? 0 : order.discount)));
// // }
// }
