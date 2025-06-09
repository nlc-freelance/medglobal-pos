import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order_item.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';
part 'order_bloc.g.dart';

class OrderBloc extends HydratedBloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState.initial()) {
    on<_AddItem>(_onAddItem);
    on<_RemoveItem>(_onRemoveItem);
    on<_UpdateItemQuantity>(_onUpdateItemQuantity);
    on<_SetItemDiscount>(_onSetItemDiscount);
    on<_RemoveItemDiscount>(_onRemoveItemDiscount);
    on<_ClearOrder>(_onClearOrder);
  }

  /// Adds a new item to the cart.
  ///
  /// If item already exists, its quantity will be incremented.
  /// Otherwise, it will be added with quantity set to 1.
  void _onAddItem(event, emit) {
    final items = List<OrderItem>.from(state.order.items);

    List<OrderItem> updatedItems;

    if (items.any((item) => item.id == event.item.id)) {
      updatedItems = items.map((item) {
        if (item.id == event.item.id) return item.copyWith(quantity: item.quantity + 1);
        return item;
      }).toList();
    } else {
      updatedItems = [...items, event.item];
    }

    emit(state.order.copyWith(items: updatedItems));
  }

  /// Removes an item from the cart.
  ///
  void _onRemoveItem(event, emit) {
    emit(state.order.copyWith(items: _removeItemById(event.id)));
  }

  /// Updates the quantity of an existing item.
  ///
  /// If the new quantity is 0, the item will be removed.
  /// Otherwise, the item quantity is replaced with new quantity.
  void _onUpdateItemQuantity(event, emit) {
    final updatedItems = event.quantity == 0
        ? _removeItemById(event.id)
        : state.order.items.map((item) {
            if (item.id == event.id) return item.copyWith(quantity: event.quantity);
            return item;
          }).toList();

    emit(state.order.copyWith(items: updatedItems));
  }

  /// Sets a discount category on an item.
  void _onSetItemDiscount(event, emit) {
    final updatedItems = state.order.items.map((item) {
      if (item.id == event.id) return item.copyWith(discount: event.discount);
      return item;
    }).toList();

    emit(state.order.copyWith(items: updatedItems));
  }

  /// Removes the discount for an item.
  ///
  void _onRemoveItemDiscount(event, emit) {
    final updatedItems = state.order.items.map((item) {
      if (item.id == event.id) return item.copyWith(discount: null);
      return item;
    }).toList();

    emit(state.order.copyWith(items: updatedItems));
  }

  /// Clears all items in the cart.
  ///
  void _onClearOrder(event, emit) => emit(OrderState.initial());

  /// Removes an item from the state by its ID.
  List<OrderItem> _removeItemById(int id) => state.order.items.where((item) => item.id != id).toList();

  @override
  OrderState? fromJson(Map<String, dynamic> json) => OrderState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OrderState state) => state.toJson();
}
