part of 'product_selection_cubit.dart';

class ProductSelectionState extends Equatable {
  final List<int> selectedProductIds;

  const ProductSelectionState(this.selectedProductIds);

  @override
  List<Object?> get props => [selectedProductIds];
}
