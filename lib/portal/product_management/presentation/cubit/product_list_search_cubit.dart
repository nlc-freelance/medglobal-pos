import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_list_search_state.dart';

class ProductListSearchCubit extends Cubit<ProductListSearchState> {
  ProductListSearchCubit() : super(const ProductListSearchState());

  void setSize(int value) => emit(state.copyWith(size: value));
  void setSearchKey(String? value) => emit(state.copyWith(search: value));
}
