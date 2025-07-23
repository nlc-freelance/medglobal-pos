part of 'variant_form_cubit.dart';

@freezed
class VariantFormState with _$VariantFormState {
  const factory VariantFormState({
    required VariantFormModel variant,
    @Default(true) bool isValid,
  }) = _VariantFormState;

  factory VariantFormState.initial() => const VariantFormState(variant: VariantFormModel());

  factory VariantFormState.load(VariantFormModel variant) => VariantFormState(variant: variant);
}

extension VariantFormStateExt on VariantFormState {
  List<Branch> get branches => variant.branchInventories?.map((variant) => variant.branch).toList() ?? [];

  bool isSupplierSelected(Supplier supplier) {
    return variant.suppliers?.where((s) => s.id == supplier.id).isNotEmpty ?? false;
  }
}
