part of 'tax_form_cubit.dart';

@freezed
class TaxFormState with _$TaxFormState {
  const factory TaxFormState({
    int? id,
    String? code,
    double? rate,
    @Default(false) bool isDefault,
  }) = _TaxFormState;

  factory TaxFormState.initial() => const TaxFormState();

  factory TaxFormState.load(Tax tax) => TaxFormState(
        id: tax.id,
        code: tax.code,
        rate: tax.rate,
        isDefault: tax.isDefault,
      );
}

extension TaxFormStateExt on TaxFormState {
  Tax toTax() {
    return Tax(
      id: id,
      code: code!,
      rate: rate!,
      isDefault: isDefault,
    );
  }
}
