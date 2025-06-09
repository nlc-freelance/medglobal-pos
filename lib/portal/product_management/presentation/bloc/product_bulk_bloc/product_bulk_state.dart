part of 'product_bulk_bloc.dart';

@freezed
class ProductBulkState with _$ProductBulkState {
  const factory ProductBulkState.initial() = _Initial;
  const factory ProductBulkState.processing() = _Processing;
  const factory ProductBulkState.success(String message) = _Success;
  const factory ProductBulkState.failure(String message) = _Failure;
}
