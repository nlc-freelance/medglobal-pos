import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';

part 'tax_form_state.dart';
part 'tax_form_cubit.freezed.dart';

class TaxFormCubit extends Cubit<TaxFormState> {
  TaxFormCubit() : super(TaxFormState.initial());

  /// Initialize current selected Tax
  void initTax(Tax tax) => emit(TaxFormState.fromTax(tax));

  void setCode(String value) => emit(state.copyWith(code: value));

  void setRate(double value) => emit(state.copyWith(rate: value));

  void setIsDefault(bool value) => emit(state.copyWith(isDefault: value));

  /// After form is validated, map TaxFormState values to a Tax
  Tax toTax() {
    return Tax(
      id: state.id,
      code: state.code!,
      rate: state.rate!,
      isDefault: state.isDefault,
    );
  }

  void reset() => emit(TaxFormState.initial());
}
