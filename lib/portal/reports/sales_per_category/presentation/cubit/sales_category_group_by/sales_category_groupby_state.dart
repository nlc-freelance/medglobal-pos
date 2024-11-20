part of 'sales_category_groupby_cubit.dart';

class SalesCategoryGroupByState extends Equatable {
  const SalesCategoryGroupByState({this.groupBy, this.timeVariance});

  final List<SalesPerCategoryGroupBy>? groupBy;
  final TimeVariance? timeVariance;

  @override
  List<Object?> get props => [groupBy, timeVariance];

  SalesCategoryGroupByState copyWith({
    List<SalesPerCategoryGroupBy>? groupBy,
    TimeVariance? timeVariance,
    bool? nullTimeVariance = false,
  }) {
    return SalesCategoryGroupByState(
      groupBy: groupBy ?? this.groupBy,
      timeVariance: nullTimeVariance == true ? null : timeVariance ?? this.timeVariance,
    );
  }

  /// Getter
  Map<String, dynamic>? get groupedBy => {
        'branch': groupBy?.contains(SalesPerCategoryGroupBy.BRANCH) == true,
        if (timeVariance != null) 'timeVariance': timeVariance?.name,
      };

  bool get isGrouped => groupBy?.isNotEmpty == true;
}
