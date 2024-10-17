import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  ProductSearchCubit() : super(const ProductSearchState());

  void setCategoryId(int value) => emit(state.copyWith(categoryId: value));
  void setSearchKey(String? value) => emit(state.copyWith(search: value));
}
