import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'supplier_list_filter_state.dart';

class SupplierListFilterCubit extends Cubit<SupplierListFilterState> {
  SupplierListFilterCubit() : super(const SupplierListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));
  void setSearch(String? value) => emit(state.copyWith(search: value));
}
