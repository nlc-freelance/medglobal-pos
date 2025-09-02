part of 'product_sales_history_filter_cubit.dart';

@freezed
class ProductSalesHistoryFilterState with _$ProductSalesHistoryFilterState {
  const factory ProductSalesHistoryFilterState({
    @Default(1) int page,
    @Default(20) int size,
    int? variantId,
    Branch? branch,
    String? startDate,
    String? endDate,
    @Default(true) bool isValid,
    String? errorMessage,
  }) = _ProductSalesHistoryFilterState;
}

extension ProductSalesHistoryFilterStateExt on ProductSalesHistoryFilterState {
  PageQuery get toPageQuery => PageQuery(
        page: page,
        size: size,
        extra: {
          'branch': branch?.id,
          'startDate': startDate,
          'endDate': endDate,
        },
      );

  Map<String, dynamic> get toReportFilter => {
        'variantId': variantId,
        'branch': branch?.id,
        'startDate': startDate,
        'endDate': endDate,
      };
}
