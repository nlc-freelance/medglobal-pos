part of 'product_sales_history_bloc.dart';

@freezed
class ProductSalesHistoryState with _$ProductSalesHistoryState {
  const factory ProductSalesHistoryState.initial() = _Initial;
  const factory ProductSalesHistoryState.loading() = _Loading;
  const factory ProductSalesHistoryState.loaded(ProductSaleHistory data) = _Loaded;
  const factory ProductSalesHistoryState.failure(String message) = _Failure;
}
