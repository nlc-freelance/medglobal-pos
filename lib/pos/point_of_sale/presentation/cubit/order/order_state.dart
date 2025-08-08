// part of 'order_cubit.dart';

// // @JsonSerializable()
// // class CartState extends Equatable {
// //   const CartState(this.order);

// //   final Transaction order;

// //   @override
// //   List<Object> get props => [order];

// //   factory CartState.initial() => const CartState(Transaction());

// //   factory CartState.fromJson(Map<String, dynamic> json) => _$OrderStateFromJson(json);

// //   Map<String, dynamic> toJson() => _$OrderStateToJson(this);
// // }

// @freezed
// class CartState with _$OrderState {
//   const factory CartState({
//     @Default([]) List<TransactionItem> items,
//   }) = _OrderState;

//   factory CartState.initial() => const CartState();
// }

// extension OrderStateExt on CartState {
//   double get subtotal => items.fold(0, (sum, item) => sum + item.totalPerItem);

//   double get tax => subtotal * 0.1;

//   double get total => subtotal + tax;
// }
