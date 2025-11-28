import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'return_transaction_list_filter_state.dart';

class ReturnTransactionListFilterCubit extends Cubit<ReturnTransactionListFilterState> {
  ReturnTransactionListFilterCubit() : super(const ReturnTransactionListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setSearch(String? value) => emit(state.copyWith(search: value));

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

  void reset() => emit(const ReturnTransactionListFilterState());
}
