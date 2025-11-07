part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded(Product product) = _Loaded;
  const factory ProductState.loadFailed(String message) = _LoadFailed;
  const factory ProductState.processing() = _Processing;
  const factory ProductState.success(String message) = _Success;
  const factory ProductState.failure(String message) = _Failure;
}
