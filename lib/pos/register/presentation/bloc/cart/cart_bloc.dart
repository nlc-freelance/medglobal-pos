import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';
part 'cart_bloc.g.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<_AddItem>(_onAddItem);
    on<_RemoveItem>(_onRemoveItem);
    on<_UpdateItemQuantity>(_onUpdateItemQuantity);
    on<_SetItemDiscount>(_onSetItemDiscount);
    on<_RemoveItemDiscount>(_onRemoveItemDiscount);
    on<_Reset>(_onReset);
  }

  /// Adds a new item to the cart.
  ///
  /// If item already exists, its quantity will be incremented.
  /// Otherwise, it will be added with quantity set to 1.
  void _onAddItem(_AddItem event, emit) {
    final items = List<OrderItem>.from(state.order.items);

    List<OrderItem> updatedItems;

    if (items.any((item) => item.itemId == event.item.itemId)) {
      updatedItems = items.map((item) {
        if (item.itemId == event.item.itemId) return item.copyWith(quantity: item.quantity + 1);
        return item;
      }).toList();
    } else {
      updatedItems = [...items, event.item];
    }

    final updatedOrder = state.order.copyWith(items: updatedItems);
    emit(state.copyWith(order: updatedOrder));
  }

  /// Removes an item from the cart.
  ///
  void _onRemoveItem(_RemoveItem event, emit) {
    final updatedItems = _removeItemById(event.id);

    final updatedOrder = state.order.copyWith(items: updatedItems);
    emit(state.copyWith(order: updatedOrder));
  }

  /// Updates the quantity of an existing item.
  ///
  /// If the new quantity is 0, the item will be removed.
  /// Otherwise, the item quantity is replaced with new quantity.
  void _onUpdateItemQuantity(_UpdateItemQuantity event, emit) {
    final newQuantity = event.quantity;

    final updatedItems = newQuantity == 0
        ? _removeItemById(event.id)
        : state.order.items.map((item) {
            if (item.id == event.id) return item.copyWith(quantity: newQuantity ?? item.quantity);
            return item;
          }).toList();

    final updatedOrder = state.order.copyWith(items: updatedItems);
    emit(state.copyWith(order: updatedOrder));
  }

  /// Sets a discount category on an item.
  void _onSetItemDiscount(_SetItemDiscount event, emit) {
    final updatedItems = state.order.items.map((item) {
      if (item.id == event.id) return item.copyWith(discount: event.discount);
      return item;
    }).toList();

    final updatedOrder = state.order.copyWith(items: updatedItems);
    emit(state.copyWith(order: updatedOrder));
  }

  /// Removes the discount for an item.
  ///
  void _onRemoveItemDiscount(_RemoveItemDiscount event, emit) {
    final updatedItems = state.order.items.map((item) {
      if (item.id == event.id) return item.copyWith(discount: null);
      return item;
    }).toList();

    final updatedOrder = state.order.copyWith(items: updatedItems);
    emit(state.copyWith(order: updatedOrder));
  }

  /// Clears all items in the cart.
  ///
  void _onReset(_Reset event, emit) => emit(CartState.initial());

  /// Removes an item from the state by its ID.
  List<OrderItem> _removeItemById(int id) => state.order.items.where((item) => item.id != id).toList();

  // @override
  // CartState? fromJson(Map<String, dynamic> json) => CartState.fromJson(json);
  //
  // @override
  // Map<String, dynamic>? toJson(CartState state) => state.toJson();
}
