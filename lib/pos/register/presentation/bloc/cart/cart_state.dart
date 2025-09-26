part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required Order order,
  }) = _OrderState;

  factory CartState.initial() => const CartState(order: Order());

  factory CartState.fromJson(Map<String, dynamic> json) => _$CartStateFromJson(json);
}

extension OrderStateExt on CartState {}
