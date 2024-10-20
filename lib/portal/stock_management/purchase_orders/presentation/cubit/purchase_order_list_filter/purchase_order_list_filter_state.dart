part of 'purchase_order_list_filter_cubit.dart';

class PurchaseOrderListFilterState extends Equatable {
  const PurchaseOrderListFilterState({this.size = 20, this.branchId, this.status, this.startDate, this.endDate});

  final int? size;
  final int? branchId;
  final StockOrderStatus? status;
  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [size, branchId, status, startDate, endDate];

  PurchaseOrderListFilterState copyWith({
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
    return PurchaseOrderListFilterState(
      size: size ?? this.size,
      branchId: nullBranch == true ? null : branchId ?? this.branchId,
      status: nullStatus == true ? null : status ?? this.status,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      endDate: nullEndDate == true ? null : endDate ?? this.endDate,
    );
  }
}
