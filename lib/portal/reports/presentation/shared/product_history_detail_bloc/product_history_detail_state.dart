part of 'product_history_detail_bloc.dart';

@freezed
class ProductHistoryDetailState<T> with _$ProductHistoryDetailState<T> {
  const factory ProductHistoryDetailState.initial() = _Initial<T>;
  const factory ProductHistoryDetailState.loading() = _Loading<T>;
  const factory ProductHistoryDetailState.loaded(T data, ProductHistoryAction action) = _Loaded<T>;
  const factory ProductHistoryDetailState.failure(String message) = _Failure<T>;
}
