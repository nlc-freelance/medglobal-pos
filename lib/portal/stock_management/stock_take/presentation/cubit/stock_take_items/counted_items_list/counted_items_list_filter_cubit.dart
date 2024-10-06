import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counted_items_list_filter_state.dart';

class CountedItemsListFilterCubit extends Cubit<CountedItemsListFilterState> {
  CountedItemsListFilterCubit() : super(const CountedItemsListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setSearch(String? value) => emit(state.copyWith(search: value));
}
