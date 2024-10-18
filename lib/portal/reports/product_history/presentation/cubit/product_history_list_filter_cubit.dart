import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_history_list_filter_state.dart';

class ProductHistoryListFilterCubit extends Cubit<ProductHistoryListFilterState> {
  ProductHistoryListFilterCubit() : super(const ProductHistoryListFilterState());

  void setVariantId(int? value) => emit(state.copyWith(variantId: value, nullVariantId: value == null));
  void setBranchId(int? value) => emit(state.copyWith(branchId: value, nullBranchId: value == null));
  void setStartDate(String? value) => emit(state.copyWith(startDate: value, nullStartDate: value == null));
  void setSize(int value) => emit(state.copyWith(size: value));
}
