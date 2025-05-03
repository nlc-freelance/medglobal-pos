part of 'branch_form_cubit.dart';

@freezed
class BranchFormState with _$BranchFormState {
  const factory BranchFormState({
    int? id,
    String? name,
    String? phone,
    String? email,
    String? street,
    String? barangay,
    String? city,
    String? province,
    String? postalCode,
    String? country,
    String? businessRegistrationNumber,
    String? vatIdNumber,
    // ReceiptTemplate receiptTemplate,
  }) = _BranchFormState;

  factory BranchFormState.initial() => const BranchFormState();

  factory BranchFormState.fromBranch(Branch1 branch) => BranchFormState(
        id: branch.id,
        name: branch.name,
        phone: branch.phone,
        email: branch.email,
        street: branch.street,
        barangay: branch.barangay,
        city: branch.city,
        province: branch.province,
        postalCode: branch.postalCode,
        country: branch.country,
        businessRegistrationNumber: branch.businessRegistrationNumber,
        vatIdNumber: branch.vatIdNumber,
      );
}
