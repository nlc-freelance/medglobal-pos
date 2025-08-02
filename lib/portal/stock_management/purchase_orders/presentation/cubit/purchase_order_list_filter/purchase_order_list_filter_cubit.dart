import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

part 'purchase_order_list_filter_state.dart';
part 'purchase_order_list_filter_cubit.freezed.dart';

class PurchaseOrderListFilterCubit extends Cubit<PurchaseOrderListFilterState> {
  PurchaseOrderListFilterCubit() : super(PurchaseOrderListFilterState.initial());

  void setPageAndSize(int page, int size) => emit(state.copyWith(page: page, size: size));

  void setBranch(int? value) => emit(state.copyWith(branchId: value));

  void setStatus(StockOrderStatus? value) => emit(state.copyWith(status: value));

  void setStartDate(String? value) => emit(state.copyWith(startDate: value));

  void setEndDate(String? value) => emit(state.copyWith(endDate: value));

  void reset() => emit(PurchaseOrderListFilterState.initial());
}
