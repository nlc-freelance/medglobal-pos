part of 'sales_category_filter_cubit.dart';

class SalesCategoryFilterState extends Equatable {
  const SalesCategoryFilterState({
    this.filters,
    this.operator = LogicalOperator.AND,
  });

  final List<Filter>? filters;
  final LogicalOperator? operator;

  @override
  List<Object?> get props => [filters, operator];

  SalesCategoryFilterState copyWith({
    List<Filter>? filters,
    LogicalOperator? operator,
  }) {
    return SalesCategoryFilterState(
      filters: filters ?? this.filters,
      operator: operator ?? this.operator,
    );
  }

  /// Getters
  List<Filter>? get(FilterType type) {
    if (filters?.isNotEmpty == true) {
      return filters!.where((filter) => filter.type == type).toSet().toList();
    } else {
      return null;
    }
  }

  bool get hasFilters => filters?.any((filter) => filter.type != null && filter.value != null) == true;

  /// Compares if every item in state filters exists in the widget filters.
  /// Widget filters hold the applied filters sent via API.
  /// State filters are the ones that get updated on UI interactions.
  bool hasFiltersChanged(List<Filter> widget) =>
      filters?.every((filterInState) => widget.contains(filterInState)) != true;
}
