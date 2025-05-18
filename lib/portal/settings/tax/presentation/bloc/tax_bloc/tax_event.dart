part of 'tax_bloc.dart';

@freezed
class TaxEvent with _$TaxEvent {
  const factory TaxEvent.getDefaultTaxCode() = _GetDefaultTaxCode;
  const factory TaxEvent.createTaxCode(Tax tax) = _CreateTaxCode;
  const factory TaxEvent.updateTaxCode(Tax tax) = _UpdateTaxCode;
  const factory TaxEvent.deleteTaxCode(Tax tax) = _DeleteTaxCode;
  const factory TaxEvent.reset() = _Reset;
}
