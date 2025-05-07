part of 'branch_bloc.dart';

@freezed
class BranchEvent with _$BranchEvent {
  const factory BranchEvent.getBranchById(int id) = _GetBranchById;
  const factory BranchEvent.createBranch(Branch1 branch) = _CreateBranch;
  const factory BranchEvent.updateBranch(Branch1 branch) = _UpdateBranch;
  const factory BranchEvent.deleteBranch(int id) = _DeleteBranch;
  const factory BranchEvent.reset() = _Reset;
}
