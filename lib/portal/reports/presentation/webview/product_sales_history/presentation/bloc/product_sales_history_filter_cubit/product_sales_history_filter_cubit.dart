import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'product_sales_history_filter_state.dart';
part 'product_sales_history_filter_cubit.freezed.dart';

class ProductSalesHistoryFilterCubit extends Cubit<ProductSalesHistoryFilterState> {
  ProductSalesHistoryFilterCubit() : super(const ProductSalesHistoryFilterState());

  void setPageAndSize(int page, int size) => emit(state.copyWith(page: page, size: size));

  void setBranch(BranchPartial? branch) => emit(state.copyWith(branch: branch));

  void setVariant(int? id) => emit(state.copyWith(variantId: id));

  void setStartDate(String? value) => emit(state.copyWith(startDate: value));

  void setEndDate(String? value) => emit(state.copyWith(endDate: value));

  void validate() {
    if (state.variantId == null || state.branch == null || state.startDate == null || state.endDate == null) {
      emit(state.copyWith(isValid: false, errorMessage: 'Product, branch, and date are required.'));
    } else {
      emit(state.copyWith(isValid: true, errorMessage: null));
    }
  }

  void reset() => emit(const ProductSalesHistoryFilterState());

  void resetPageAndSize() => emit(state.copyWith(page: 1, size: 20));
}
