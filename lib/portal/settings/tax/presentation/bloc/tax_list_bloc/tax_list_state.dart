part of 'tax_list_bloc.dart';

@freezed
class TaxListState with _$TaxListState {
  const factory TaxListState.initial() = _Initial;
  const factory TaxListState.loading() = _Loading;
  const factory TaxListState.success(PaginatedList<Tax> data) = _Success;
  const factory TaxListState.empty() = _Empty;
  const factory TaxListState.failure(String message) = _Failure;
}
