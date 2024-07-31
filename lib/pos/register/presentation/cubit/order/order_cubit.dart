import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order_item.dart';

part 'order_cubit.g.dart';
part 'order_state.dart';

class OrderCubit extends HydratedCubit<OrderState> {
  OrderCubit() : super(OrderState.initial());

  void setNewOrder(Order order) => emit(OrderState(order));

  void addItem(OrderItem value) {
    final orderItems = state.order.items?.toList() ?? [];

    /// check if item is already in order.items, if yes increment qty, else add and set qty to 1
    List<OrderItem> updatedItems;
    if (orderItems.any((item) => item.id == value.itemId)) {
      updatedItems = orderItems.map((item) {
        if (item.itemId == value.itemId) return item.copyWith(qty: item.qty! + 1);
        return item;
      }).toList();
    } else {
      updatedItems = [...orderItems, value.copyWith(qty: 1)];
    }

    emit(OrderState(state.order.copyWith(items: updatedItems, subtotal: calculateSubtotal(updatedItems))));
  }

  void removeItem(int id) {
    final items = state.order.items?.toList() ?? [];
    items.removeWhere((item) => item.id == id);

    emit(OrderState(state.order.copyWith(items: items, subtotal: calculateSubtotal(items))));
  }

  void setQtyPerItem({required int id, int? qty}) {
    final items = state.order.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) {
        return item.copyWith(qty: qty);
      }
      return item;
    }).toList();

    emit(OrderState(state.order.copyWith(items: updatedItems, subtotal: calculateSubtotal(updatedItems))));
  }

  void setDiscountPerItem({required int id, double? discount, required DiscountType type}) {
    final items = state.order.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) {
        /// Compute discounted price per item
        double? discountedPrice = 0;
        if (discount != null) {
          if (type == DiscountType.PERCENT) discountedPrice = item.price! - (item.price! * (discount / 100));
          if (type == DiscountType.PESO) discountedPrice = item.price! - discount;
        }

        return item.copyWith(
          discount: discount,
          discountType: type,
          discountedPrice: roundToTwoDecimalPlaces(discountedPrice),
        );
      }
      return item;
    }).toList();

    emit(OrderState(state.order.copyWith(items: updatedItems, subtotal: calculateSubtotal(updatedItems))));
  }

  void setDiscountTypePerItem({required int id, required DiscountType type}) {
    final items = state.order.items?.toList() ?? [];

    /// Update discounted price per item on toggle of discount type
    final updatedItems = items.map((item) {
      if (item.id == id) {
        double? discountedPrice = 0;
        if (item.discount != null) {
          if (type == DiscountType.PERCENT) discountedPrice = item.price! - (item.price! * (item.discount! / 100));
          if (type == DiscountType.PESO) discountedPrice = item.price! - item.discount!;
        }
        return item.copyWith(discountType: type, discountedPrice: roundToTwoDecimalPlaces(discountedPrice));
      }
      return item;
    }).toList();

    emit(OrderState(state.order.copyWith(items: updatedItems, subtotal: calculateSubtotal(updatedItems))));
  }

  void setDiscount({double? discount, required DiscountType type}) {
    final order = state.order;

    /// Compute discount in peso for the total bill
    double? discountInPeso = 0;
    if (discount != null) {
      if (type == DiscountType.PERCENT) discountInPeso = order.subtotal! * (discount / 100);
      if (type == DiscountType.PESO) discountInPeso = discount;
    }

    emit(OrderState(state.order.copyWith(
      discount: discount,
      discountType: type,
      discountInPeso: discountInPeso,
    )));
  }

  void setDiscountType(DiscountType type) {
    final order = state.order;

    /// Compute discount in peso
    double? discountInPeso = 0;
    if (order.discount != null) {
      if (type == DiscountType.PERCENT) discountInPeso = order.subtotal! * (order.discount! / 100);
      if (type == DiscountType.PESO) discountInPeso = order.discount!;
    }

    emit(OrderState(state.order.copyWith(
      discountType: type,
      discountInPeso: discountInPeso,
    )));
  }

  // Add tax to subtract
  void computeTotal() {
    final order = state.order;

    double total = 0;
    if (order.subtotal != null) total = state.order.subtotal! - (order.discountInPeso ?? 0);

    emit(OrderState(state.order.copyWith(total: roundToTwoDecimalPlaces(total))));
  }

  void computeDiscountInPeso() {
    final order = state.order;

    double discountInPeso = 0;
    if (order.discount != null) {
      if (order.discountType == DiscountType.PERCENT) discountInPeso = order.subtotal! * (order.discount! / 100);
      if (order.discountType == DiscountType.PESO) discountInPeso = order.discount!;
    }

    emit(OrderState(
        state.order.copyWith(discountInPeso: discountInPeso, discount: discountInPeso == 0 ? 0 : order.discount)));
  }

  void reset() => emit(const OrderState(Order()));

  @override
  OrderState? fromJson(Map<String, dynamic> json) => OrderState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OrderState state) => state.toJson();
}

double calculateSubtotal(List<OrderItem> items) =>
    roundToTwoDecimalPlaces(items.fold(0.0, (total, item) => total + item.totalPricePerItem));

double roundToTwoDecimalPlaces(double value) => (value * 100).round() / 100;
