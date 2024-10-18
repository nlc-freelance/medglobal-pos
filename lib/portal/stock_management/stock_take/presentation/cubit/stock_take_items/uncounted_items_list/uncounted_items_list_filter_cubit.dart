import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'uncounted_items_list_filter_state.dart';

class UncountedItemsListFilterCubit extends Cubit<UncountedItemsListFilterState> {
  UncountedItemsListFilterCubit() : super(const UncountedItemsListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setSearch(String? value) => emit(state.copyWith(search: value));
}
