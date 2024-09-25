part of 'stock_return_list_filter_cubit.dart';

class StockReturnListFilterState extends Equatable {
  const StockReturnListFilterState({this.size = 20, this.branchId, this.status});

  final int? size;
  final int? branchId;
  final StockOrderStatus? status;

  @override
  List<Object?> get props => [size, branchId, status];

  StockReturnListFilterState copyWith({
    int? size,
    int? branchId,
    StockOrderStatus? status,
    bool? nullBranch = false,
    bool? nullStatus = false,
  }) {
    return StockReturnListFilterState(
      size: size ?? this.size,
      branchId: nullBranch == true ? null : branchId ?? this.branchId,
      status: nullStatus == true ? null : status ?? this.status,
    );
  }
}
