import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sales_category_period_state.dart';

class SalesCategoryPeriodCubit extends Cubit<SalesCategoryPeriodState> {
  SalesCategoryPeriodCubit() : super(const SalesCategoryPeriodState());

  void setStartDate(String value) => emit(state.copyWith(startDate: value));

  void setEndDate(String value) => emit(state.copyWith(endDate: value));
}
