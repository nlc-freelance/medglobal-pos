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
  }) = _BranchFormState;

  factory BranchFormState.initial() => const BranchFormState();

  factory BranchFormState.fromBranch(Branch branch) => BranchFormState(
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
      );
}
