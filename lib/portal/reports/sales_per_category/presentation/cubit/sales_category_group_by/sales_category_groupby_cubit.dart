import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'sales_category_groupby_state.dart';

class SalesCategoryGroupByCubit extends Cubit<SalesCategoryGroupByState> {
  SalesCategoryGroupByCubit() : super(const SalesCategoryGroupByState());

  void setGroupBy(List<SalesPerCategoryGroupBy> value) {
    final groupBy = List<SalesPerCategoryGroupBy>.from(value);

    /// When time variable category is deselected, reset the time variance
    final resetTimeVariance = !groupBy.contains(SalesPerCategoryGroupBy.TIME_VARIANCE);

    emit(state.copyWith(groupBy: groupBy, nullTimeVariance: resetTimeVariance));
  }

  void setTimeVariance(TimeVariance value) => emit(state.copyWith(timeVariance: value));

  void reset() => emit(const SalesCategoryGroupByState());
}
