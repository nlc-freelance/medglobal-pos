part of 'tax_list_bloc.dart';

@freezed
class TaxListEvent with _$TaxListEvent {
  const factory TaxListEvent.getTaxCodes({int? page, int? size}) = _GetAllTaxCodes;
}
