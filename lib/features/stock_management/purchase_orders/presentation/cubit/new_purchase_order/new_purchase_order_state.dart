part of 'new_purchase_order_cubit.dart';

class NewPurchaseOrderState extends Equatable {
  const NewPurchaseOrderState(this.payload);

  final NewPurchaseOrder payload;

  @override
  List<Object?> get props => [payload];

  factory NewPurchaseOrderState.initial() => NewPurchaseOrderState(NewPurchaseOrder());
}
