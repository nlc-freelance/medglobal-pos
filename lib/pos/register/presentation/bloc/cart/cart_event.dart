part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addItem(OrderItem item) = _AddItem;
  const factory CartEvent.removeItem(int id) = _RemoveItem;
  const factory CartEvent.updateItemQuantity(int id, int? quantity) = _UpdateItemQuantity;
  const factory CartEvent.setItemDiscount(int id, DiscountCategory discount) = _SetItemDiscount;
  const factory CartEvent.removeItemDiscount(int id) = _RemoveItemDiscount;
  const factory CartEvent.reset() = _Reset;
}
