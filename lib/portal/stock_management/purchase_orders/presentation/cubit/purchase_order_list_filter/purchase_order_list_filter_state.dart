part of 'purchase_order_list_filter_cubit.dart';

class PurchaseOrderListFilterState extends Equatable {
  const PurchaseOrderListFilterState({this.size = 20, this.branchId, this.status});

  final int? size;
  final int? branchId;
  final StockOrderStatus? status;

  @override
  List<Object?> get props => [size, branchId, status];

  PurchaseOrderListFilterState copyWith({
    int? size,
    int? branchId,
    StockOrderStatus? status,
    bool? nullBranch = false,
    bool? nullStatus = false,
  }) {
    return PurchaseOrderListFilterState(
      size: size ?? this.size,
      branchId: nullBranch == true ? null : branchId ?? this.branchId,
      status: nullStatus == true ? null : status ?? this.status,
    );
  }
}
