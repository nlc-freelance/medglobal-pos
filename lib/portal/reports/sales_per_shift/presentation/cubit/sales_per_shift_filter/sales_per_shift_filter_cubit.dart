import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sales_per_shift_filter_state.dart';

class SalesPerShiftListFilterCubit extends Cubit<SalesPerShiftListFilterState> {
  SalesPerShiftListFilterCubit() : super(const SalesPerShiftListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setBranch(int? value) => emit(
        state.copyWith(
          branchId: value,
          nullBranch: value == null,
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

  void reset() => emit(const SalesPerShiftListFilterState());
}
