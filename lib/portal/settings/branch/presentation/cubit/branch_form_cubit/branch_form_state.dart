part of 'branch_form_cubit.dart';

@freezed
class BranchFormState with _$BranchFormState {
  const factory BranchFormState({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? street1,
    String? street2,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? businessRegistrationNumber,
    String? vatIdNumber,
    ReceiptTemplate? receiptTemplate,
    @Default(true) bool isReceiptTemplateValid,
    @Default(true) bool isFormValid,
  }) = _BranchFormState;

  factory BranchFormState.initial() => const BranchFormState();

  factory BranchFormState.load(Branch branch) => BranchFormState(
        id: branch.id,
        name: branch.name,
        phone: branch.phone,
        email: branch.email,
        street1: branch.street1,
        street2: branch.street2,
        city: branch.city,
        state: branch.state,
        postalCode: branch.postalCode,
        country: branch.country,
        businessRegistrationNumber: branch.businessRegistrationNumber,
        vatIdNumber: branch.vatIdNumber,
        receiptTemplate: branch.receiptTemplate,
      );
}

extension BranchFormStateExt on BranchFormState {
  bool validateForm() =>
      name?.isNotEmpty == true &&
      phone?.isNotEmpty == true &&
      street1?.isNotEmpty == true &&
      city?.isNotEmpty == true &&
      state?.isNotEmpty == true &&
      businessRegistrationNumber?.isNotEmpty == true &&
      receiptTemplate != null;

  Branch toBranch() => Branch(
        id: id,
        accountId: 2, // Default to 2 for MedGlobal account, later add in env variables
        name: name!,
        phone: phone!,
        email: email,
        street1: street1!,
        street2: street2,
        city: city!,
        state: state!,
        postalCode: postalCode,
        country: country,
        businessRegistrationNumber: businessRegistrationNumber!,
        vatIdNumber: vatIdNumber,
        receiptTemplate: receiptTemplate!,
      );
}
