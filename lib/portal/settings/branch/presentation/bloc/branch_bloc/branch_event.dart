part of 'branch_bloc.dart';

@freezed
class BranchEvent with _$BranchEvent {
  const factory BranchEvent.getBranchById(int id) = _GetBranchById;
  const factory BranchEvent.getDefaultReceipt() = _GetDefaultReceipt;
  const factory BranchEvent.createBranch(Branch branch) = _CreateBranch;
  const factory BranchEvent.updateBranch(Branch branch) = _UpdateBranch;
  const factory BranchEvent.deleteBranch(Branch branch) = _DeleteBranch;
}
