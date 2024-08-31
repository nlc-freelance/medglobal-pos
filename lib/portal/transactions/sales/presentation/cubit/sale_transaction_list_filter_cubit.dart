import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sale_transaction_list_filter_state.dart';

class SaleTransactionListFilterCubit extends Cubit<SaleTransactionListFilterState> {
  SaleTransactionListFilterCubit() : super(const SaleTransactionListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));
  void setSearchKey(String? value) => emit(state.copyWith(search: value));
  void setBranch(int? value) => emit(state.copyWith(branch: value));
}
