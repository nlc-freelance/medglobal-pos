part of 'purchase_order_list_filter_cubit.dart';

class PurchaseOrderListFilterState extends Equatable {
  const PurchaseOrderListFilterState({this.size = 20, this.branch, this.status});

  final int? size;
  final int? branch;
  final StockOrderStatus? status;

  @override
  List<Object?> get props => [size, branch, status];

  PurchaseOrderListFilterState copyWith({
    int? size,
    int? branch,
    StockOrderStatus? status,
    bool? nullBranch = false,
    bool? nullStatus = false,
  }) {
    return PurchaseOrderListFilterState(
      size: size ?? this.size,
      branch: nullBranch == true ? null : branch ?? this.branch,
      status: nullStatus == true ? null : status ?? this.status,
    );
  }
}
