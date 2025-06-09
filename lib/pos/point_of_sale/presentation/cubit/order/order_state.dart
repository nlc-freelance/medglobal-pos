// part of 'order_cubit.dart';

// // @JsonSerializable()
// // class OrderState extends Equatable {
// //   const OrderState(this.order);

// //   final Transaction order;

// //   @override
// //   List<Object> get props => [order];

// //   factory OrderState.initial() => const OrderState(Transaction());

// //   factory OrderState.fromJson(Map<String, dynamic> json) => _$OrderStateFromJson(json);

// //   Map<String, dynamic> toJson() => _$OrderStateToJson(this);
// // }

// @freezed
// class OrderState with _$OrderState {
//   const factory OrderState({
//     @Default([]) List<TransactionItem> items,
//   }) = _OrderState;

//   factory OrderState.initial() => const OrderState();
// }

// extension OrderStateExt on OrderState {
//   double get subtotal => items.fold(0, (sum, item) => sum + item.totalPerItem);

//   double get tax => subtotal * 0.1;

//   double get total => subtotal + tax;
// }
