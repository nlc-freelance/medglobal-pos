part of 'variant_form_cubit.dart';

class VariantFormState extends Equatable {
  const VariantFormState(this.variant);

  final Variant? variant;

  @override
  List<Object?> get props => [variant];

  factory VariantFormState.initial() => const VariantFormState(Variant());
}
