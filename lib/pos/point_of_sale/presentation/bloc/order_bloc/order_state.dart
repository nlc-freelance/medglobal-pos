part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState({
    required Order order,
  }) = _OrderState;

  factory OrderState.initial() => const OrderState(order: Order());

  factory OrderState.fromJson(Map<String, dynamic> json) => _$OrderStateFromJson(json);
}

extension OrderStateExt on OrderState {}
