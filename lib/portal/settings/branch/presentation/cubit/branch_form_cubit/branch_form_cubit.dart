import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'branch_form_state.dart';
part 'branch_form_cubit.freezed.dart';

class BranchFormCubit extends Cubit<BranchFormState> {
  BranchFormCubit() : super(BranchFormState.initial());

  void loadBranch(Branch branch) => emit(BranchFormState.load(branch));

  void setName(String name) => emit(state.copyWith(name: name));

  void setPhone(String phone) => emit(state.copyWith(phone: phone));

  void setEmail(String email) => emit(state.copyWith(email: email));

  void setStreet1(String stree1) => emit(state.copyWith(street1: stree1));

  void setStreet2(String street2) => emit(state.copyWith(street2: street2));

  void setCity(String city) => emit(state.copyWith(city: city));

  void setState(String stateProvice) => emit(state.copyWith(state: stateProvice));

  void setPostalCode(String postalCode) => emit(state.copyWith(postalCode: postalCode));

  void setCountry(String? country) => emit(state.copyWith(country: country));

  void setBusinessRegistrationNumber(String businessRegistrationNumberId) {
    emit(state.copyWith(businessRegistrationNumber: businessRegistrationNumberId));
  }

  void setVatIdNumber(String vatId) => emit(state.copyWith(vatIdNumber: vatId));

  void setReceiptTemplate(ReceiptTemplate? receiptTemplate) {
    emit(state.copyWith(
      receiptTemplate: receiptTemplate,
      isReceiptTemplateValid: receiptTemplate != null,
    ));
  }

  /// Validates the form fields before passing them to Bloc,
  /// and updates [isFormValid] in the state so the UI can respond accordingly.
  /// (e.g., showing a snackbar when the form is invalid)
  void validate() => emit(state.copyWith(isFormValid: state.validateForm()));
}
