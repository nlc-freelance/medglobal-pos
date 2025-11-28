part of 'product_sales_history_bloc.dart';

@freezed
class ProductSalesHistoryEvent with _$ProductSalesHistoryEvent {
  const factory ProductSalesHistoryEvent.fetch(int variantId, PageQuery query) = _Fetch;
  const factory ProductSalesHistoryEvent.reset() = _Reset;
}
