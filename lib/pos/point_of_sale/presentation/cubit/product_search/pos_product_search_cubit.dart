import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pos_product_search_state.dart';

class PosProductSearchCubit extends Cubit<PosProductSearchState> {
  PosProductSearchCubit() : super(const PosProductSearchState());

  void setCategoryId(int value) => emit(state.copyWith(categoryId: value));
  void setSearchKey(String? value) => emit(state.copyWith(search: value));
}
