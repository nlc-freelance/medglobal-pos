import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'branch_form_state.dart';
part 'branch_form_cubit.freezed.dart';

class BranchFormCubit extends Cubit<BranchFormState> {
  BranchFormCubit() : super(BranchFormState.initial());

  void initBranch(Branch branch) => emit(BranchFormState.fromBranch(branch));

  void setName(String name) => emit(state.copyWith(name: name));

  void setPhone(String phone) => emit(state.copyWith(phone: phone));

  void setEmail(String email) => emit(state.copyWith(email: email));

  void setStreet1(String stree1) => emit(state.copyWith(street1: stree1));

  void setStreet2(String street2) => emit(state.copyWith(street2: street2));

  void setCity(String city) => emit(state.copyWith(city: city));

  void setState(String stateProvice) => emit(state.copyWith(state: stateProvice));

  void setPostalCode(String postalCode) => emit(state.copyWith(postalCode: postalCode));

  void setCountry(String? country) => emit(state.copyWith(country: country));

  void setBusinessRegistrationNumber(String brnId) => emit(state.copyWith(businessRegistrationNumber: brnId));

  void setVatIdNumber(String vatId) => emit(state.copyWith(vatIdNumber: vatId));

  void setReceiptTemplate(ReceiptTemplate? receiptTemplate) => emit(state.copyWith(
        receiptTemplate: receiptTemplate,
        isFormValid: receiptTemplate != null,
      ));

  void validate() {
    emit(state.copyWith(isFormValid: state.hasValidForm()));
  }

  /// Given that the form is validated, map BranchFormState values to a Branch
  Branch toBranch() {
    return Branch(
      id: state.id,
      accountId: 2, // Default to 1 for MedGlobal account, later add in env variables
      name: state.name!,
      phone: state.phone!,
      email: state.email,
      street1: state.street1!,
      street2: state.street2,
      city: state.city!,
      state: state.state!,
      postalCode: state.postalCode,
      country: state.country,
      businessRegistrationNumber: state.businessRegistrationNumber!,
      vatIdNumber: state.vatIdNumber,
      receiptTemplate: state.receiptTemplate!,
    );
  }
}
