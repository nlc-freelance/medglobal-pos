part of 'sales_category_period_cubit.dart';

class SalesCategoryPeriodState extends Equatable {
  const SalesCategoryPeriodState({this.startDate, this.endDate});

  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [startDate, endDate];

  SalesCategoryPeriodState copyWith({
    String? startDate,
    String? endDate,
  }) {
    return SalesCategoryPeriodState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
