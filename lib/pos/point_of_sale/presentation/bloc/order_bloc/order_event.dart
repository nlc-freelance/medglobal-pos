part of 'order_bloc.dart';

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent.addItem(OrderItem item) = _AddItem;
  const factory OrderEvent.removeItem(int id) = _RemoveItem;
  const factory OrderEvent.updateItemQuantity(int id, int quantity) = _UpdateItemQuantity;
  const factory OrderEvent.setItemDiscount(int id, DiscountCategory discount) = _SetItemDiscount;
  const factory OrderEvent.removeItemDiscount(int id) = _RemoveItemDiscount;
  const factory OrderEvent.clearOrder() = _ClearOrder;
}
