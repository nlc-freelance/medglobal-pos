import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pos_product_list_search_state.dart';

class PosProductListSearchCubit extends Cubit<PosProductListSearchState> {
  PosProductListSearchCubit() : super(const PosProductListSearchState());

  void setCategoryId(int value) => emit(state.copyWith(categoryId: value));
  void setSearchKey(String? value) => emit(state.copyWith(search: value));
}
