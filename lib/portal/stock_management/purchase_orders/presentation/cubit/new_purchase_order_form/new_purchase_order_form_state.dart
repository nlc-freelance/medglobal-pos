part of 'new_purchase_order_form_cubit.dart';

class NewPurchaseOrderFormState extends Equatable {
  const NewPurchaseOrderFormState(this.newPurchaseOrder);

  final NewPurchaseOrder newPurchaseOrder;

  @override
  List<Object?> get props => [newPurchaseOrder];

  factory NewPurchaseOrderFormState.initial() => const NewPurchaseOrderFormState(NewPurchaseOrder());
}
