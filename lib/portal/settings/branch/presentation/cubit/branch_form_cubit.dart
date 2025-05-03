import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/branch1.dart';

part 'branch_form_state.dart';
part 'branch_form_cubit.freezed.dart';

class BranchFormCubit extends Cubit<BranchFormState> {
  BranchFormCubit() : super(BranchFormState.initial());

  void initBranch(Branch1 branch) => emit(BranchFormState.fromBranch(branch));

  void setName(String value) => emit(state.copyWith(name: value));

  void setPhone(String value) => emit(state.copyWith(phone: value));

  void setEmail(String value) => emit(state.copyWith(email: value));

  void setStreet(String value) => emit(state.copyWith(street: value));

  void setBarangay(String value) => emit(state.copyWith(barangay: value));

  void setCity(String value) => emit(state.copyWith(city: value));

  void setProvince(String value) => emit(state.copyWith(province: value));

  void setPostalCode(String value) => emit(state.copyWith(postalCode: value));

  void setCountry(String value) => emit(state.copyWith(country: value));

  void setBusinessRegistrationNumber(String value) => emit(state.copyWith(businessRegistrationNumber: value));

  void setVatIdNumber(String value) => emit(state.copyWith(vatIdNumber: value));

  // void setReceiptTemplate(String value) => emit(state.copyWith(receiptTemplate: value));

  void reset() => emit(BranchFormState.initial());
}
