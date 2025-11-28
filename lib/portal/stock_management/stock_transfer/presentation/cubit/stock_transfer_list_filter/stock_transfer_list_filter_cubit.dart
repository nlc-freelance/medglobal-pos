import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'stock_transfer_list_filter_state.dart';

class StockTransferListFilterCubit extends Cubit<StockTransferListFilterState> {
  StockTransferListFilterCubit() : super(const StockTransferListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setSourceBranch(Branch? value) => emit(
        state.copyWith(
          sourceBranch: value,
          nullSourceBranch: value == null,
        ),
      );

  void setDestinationBranch(Branch? value) => emit(
        state.copyWith(
          destinationBranch: value,
          nullDestinationBranch: value == null,
        ),
      );

  void setStatus(StockOrderStatus? value) => emit(
        state.copyWith(
          status: value,
          nullStatus: value == null,
        ),
      );

  void setStartDate(String? value) => emit(
        state.copyWith(
          startDate: value,
          nullStartDate: value == null,
        ),
      );

  void setEndDate(String? value) => emit(
        state.copyWith(
          endDate: value,
          nullEndDate: value == null,
        ),
      );

  void reset() => emit(const StockTransferListFilterState());
}
