part of 'product_history_detail_bloc.dart';

@freezed
class ProductHistoryDetailEvent<T> with _$ProductHistoryDetailEvent<T> {
  const factory ProductHistoryDetailEvent.getById(int id, ProductHistoryAction action) = _GetDetailsById<T>;
}
