part of 'product_performance_list_filter_cubit.dart';

@freezed
class ProductPerformanceListFilterState with _$ProductPerformanceListFilterState {
  const factory ProductPerformanceListFilterState({
    @Default(1) int page,
    @Default(20) int size,
    ReportType? type,
  }) = _ProductPerformanceListFilterState;

  factory ProductPerformanceListFilterState.initial() => const ProductPerformanceListFilterState();
}

extension PurchaseOrderListFilterStateExt on ProductPerformanceListFilterState {
  PageQuery get toPageQuery => PageQuery(
        page: page,
        size: size,
        extra: {
          'type': type?.value ?? [ReportType.productPNL.value, ReportType.productABC.value].join(','),
        },
      );
}
