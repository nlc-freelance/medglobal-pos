part of 'tax_bloc.dart';

@freezed
class TaxState with _$TaxState {
  const factory TaxState.initial() = _Initial;
  const factory TaxState.loading() = _Loading;
  // Success state for getById, create and update
  const factory TaxState.success(Tax tax, {@Default('') String message}) = _Success;
  const factory TaxState.deleted(String message) = _Deleted;
  const factory TaxState.failure(String message) = _Failure;
}
