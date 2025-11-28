part of 'tax_bloc.dart';

@freezed
class TaxState with _$TaxState {
  const factory TaxState.initial() = _Initial;
  const factory TaxState.processing() = _Processing;
  const factory TaxState.success(String message) = _Success;
  const factory TaxState.deleted(String message) = _Deleted;
  const factory TaxState.hasExistingDefault(Tax? defaultTax) = _HasExistingDefault;
  const factory TaxState.failure(String message) = _Failure;
}
