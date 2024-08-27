part of 'order_cubit.dart';

@JsonSerializable()
class OrderState extends Equatable {
  const OrderState(this.order);

  final Transaction order;

  @override
  List<Object> get props => [order];

  factory OrderState.initial() => const OrderState(Transaction());

  factory OrderState.fromJson(Map<String, dynamic> json) => _$OrderStateFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStateToJson(this);
}
