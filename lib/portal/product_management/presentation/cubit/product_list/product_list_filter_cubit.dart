import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_list_filter_state.dart';

class ProductListFilterCubit extends Cubit<ProductListFilterState> {
  ProductListFilterCubit() : super(const ProductListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));
  void setSearchKey(String? value) => emit(state.copyWith(search: value));
}
