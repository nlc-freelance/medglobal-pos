import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

part 'supplier_list_filter_state.dart';
part 'supplier_list_filter_cubit.freezed.dart';

class SupplierListFilterCubit extends Cubit<SupplierListFilterState> {
  SupplierListFilterCubit() : super(SupplierListFilterState.initial());

  void setPageAndSize(int page, int size) => emit(state.copyWith(page: page, size: size));

  void setSearch(String search) => emit(state.copyWith(page: 1, search: search));

  void reset() => emit(SupplierListFilterState.initial());
}
