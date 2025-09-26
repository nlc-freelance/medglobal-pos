part of 'sale_bloc.dart';

@freezed
class SaleState with _$SaleState {
  const factory SaleState.initial() = _Initial;
  const factory SaleState.processing() = _Processing;
  const factory SaleState.success(Transaction transaction) = _Success;
  const factory SaleState.failure(String message) = _Failure;
}
