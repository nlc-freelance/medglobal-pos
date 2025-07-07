part of 'product_performance_list_bloc.dart';

@freezed
class ProductPerformanceListState with _$ProductPerformanceListState {
  const factory ProductPerformanceListState.initial() = _Initial;
  const factory ProductPerformanceListState.loading() = _Loading;
  const factory ProductPerformanceListState.loaded(PaginatedList<Report> data, {@Default(false) addedNew}) = _Loaded;
  const factory ProductPerformanceListState.empty() = _Empty;
  const factory ProductPerformanceListState.failure(String message) = _Failure;
}
