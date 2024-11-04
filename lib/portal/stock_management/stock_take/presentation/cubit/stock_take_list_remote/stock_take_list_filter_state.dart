part of 'stock_take_list_filter_cubit.dart';

class StockTakeListFilterState extends Equatable {
  const StockTakeListFilterState({this.size = 20, this.status, this.startDate, this.endDate});

  final int? size;
  final StockOrderStatus? status;
  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [size, status, startDate, endDate];

  StockTakeListFilterState copyWith({
    int? size,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
    bool? nullStatus = false,
    bool? nullStartDate = false,
    bool? nullEndDate = false,
  }) {
    return StockTakeListFilterState(
      size: size ?? this.size,
      status: nullStatus == true ? null : status ?? this.status,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      endDate: nullEndDate == true ? null : endDate ?? this.endDate,
    );
  }
}
