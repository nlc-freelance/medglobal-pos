import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'purchase_order_list_filter_state.dart';

class PurchaseOrderListFilterCubit extends Cubit<PurchaseOrderListFilterState> {
  PurchaseOrderListFilterCubit() : super(const PurchaseOrderListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setBranch(int? value) => emit(
        state.copyWith(
          branchId: value,
          nullBranch: value == null,
        ),
      );

  void setStatus(StockOrderStatus? value) => emit(
        state.copyWith(
          status: value,
          nullStatus: value == null,
        ),
      );

  void setStartDate(String? value) => emit(state.copyWith(
        startDate: value,
        nullStartDate: value == null,
      ));

  void setEndDate(String? value) => emit(state.copyWith(
        endDate: value,
        nullEndDate: value == null,
      ));
}
