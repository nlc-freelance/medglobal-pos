import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_selection_state.dart';

class ProductSelectionCubit extends Cubit<ProductSelectionState> {
  ProductSelectionCubit() : super(const ProductSelectionState([]));

  void addAllProductIds(List<int> ids) => emit(ProductSelectionState(ids.toList()));
}
