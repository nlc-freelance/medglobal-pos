part of 'purchase_order_list_filter_cubit.dart';

@freezed
class PurchaseOrderListFilterState with _$PurchaseOrderListFilterState {
  const factory PurchaseOrderListFilterState({
    @Default(1) int page,
    @Default(20) int size,
    int? branchId,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  }) = _PurchaseOrderListFilterState;

  factory PurchaseOrderListFilterState.initial() => const PurchaseOrderListFilterState();
}

extension PurchaseOrderListFilterStateExt on PurchaseOrderListFilterState {
  PageQuery get toPageQuery => PageQuery(
        page: page,
        size: size,
        extra: {
          'status': status?.label.toLowerCase(),
          'branch': branchId,
          'startDate': startDate,
          'endDate': endDate,
        },
      );
}
