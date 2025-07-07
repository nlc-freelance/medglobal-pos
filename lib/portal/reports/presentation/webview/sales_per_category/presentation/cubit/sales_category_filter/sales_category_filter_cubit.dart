import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/filter.dart';
import 'package:uuid/uuid.dart';

part 'sales_category_filter_state.dart';

class SalesCategoryFilterCubit extends Cubit<SalesCategoryFilterState> {
  SalesCategoryFilterCubit() : super(const SalesCategoryFilterState());

  void addFilter() {
    final filters = state.filters ?? <Filter>[];
    final updatedFilters = List<Filter>.from(filters)..add(Filter(id: const Uuid().v4().hashCode));
    emit(state.copyWith(filters: updatedFilters));
  }

  void updateFilterType(int id, FilterType type) {
    final filters = state.filters ?? <Filter>[];
    final updatedFilters = filters.map((filter) => filter.id == id ? filter.copyWith(type: type) : filter).toList();
    emit(state.copyWith(filters: updatedFilters));
  }

  void updateFilterRule(int id, FilterRule value) {
    final filters = state.filters ?? <Filter>[];
    final updatedFilters = filters.map((filter) => filter.id == id ? filter.copyWith(rule: value) : filter).toList();
    emit(state.copyWith(filters: updatedFilters));
  }

  void updateFilterValue(int id, dynamic value) {
    final filters = state.filters ?? <Filter>[];
    final updatedFilters = filters
        .map((filter) => filter.id == id ? filter.copyWith(value: value, nullValue: value == null) : filter)
        .toList();
    emit(state.copyWith(filters: updatedFilters));
  }

  void updateLogicalOperation(LogicalOperator operator) => emit(state.copyWith(operator: operator));

  void removeFilter(int id) {
    final filters = state.filters ?? <Filter>[];
    final updatedFilters = filters.where((filter) => filter.id != id).toList();
    emit(state.copyWith(filters: updatedFilters));
  }

  /// When there's only one Filter, do not remove the Filter, only reset the value to null
  void resetLastFilterRow(int id) {
    final filters = state.filters ?? <Filter>[];
    final updatedFilters = filters
        .map((filter) => filter.id == id
            ? filter.copyWith(type: null, nullType: true, rule: FilterRule.IS, value: null, nullValue: true)
            : filter)
        .toList();
    emit(state.copyWith(filters: updatedFilters));
  }

  void clearAll() {
    final filters = state.filters ?? <Filter>[];
    final defaultFilter = filters.first;

    /// Reset filter values
    final updatedFilters = [defaultFilter]
        .map((filter) => filter.copyWith(type: null, nullType: true, rule: FilterRule.IS, value: null, nullValue: true))
        .toList();
    emit(state.copyWith(filters: updatedFilters));
  }
}
