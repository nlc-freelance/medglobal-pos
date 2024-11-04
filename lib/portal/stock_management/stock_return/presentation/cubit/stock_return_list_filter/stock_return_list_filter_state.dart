part of 'stock_return_list_filter_cubit.dart';

class StockReturnListFilterState extends Equatable {
  const StockReturnListFilterState({this.size = 20, this.branchId, this.status, this.startDate, this.endDate});

  final int? size;
  final int? branchId;
  final StockOrderStatus? status;
  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [size, branchId, status, startDate, endDate];

  StockReturnListFilterState copyWith({
    int? size,
    int? branchId,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
    bool? nullBranch = false,
    bool? nullStatus = false,
    bool? nullStartDate = false,
    bool? nullEndDate = false,
  }) {
    return StockReturnListFilterState(
      size: size ?? this.size,
      branchId: nullBranch == true ? null : branchId ?? this.branchId,
      status: nullStatus == true ? null : status ?? this.status,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      endDate: nullEndDate == true ? null : endDate ?? this.endDate,
    );
  }
}
