part of 'branch_bloc.dart';

@freezed
class BranchState with _$BranchState {
  const factory BranchState.initial() = _Initial;

  // For creating a new branch, fetch the system default receipt template
  const factory BranchState.initializingNewBranch() = _InitializingNewBranch;
  const factory BranchState.newBranch(ReceiptTemplate template) = _NewBranch;

  // Fetch by id
  const factory BranchState.loading() = _Loading;
  const factory BranchState.loaded(Branch branch) = _Loaded;
  const factory BranchState.loadFailed(String message) = _LoadFailed;

  // Create, update, delete
  const factory BranchState.processing() = _Processing;
  const factory BranchState.success(String message) = _Success;
  const factory BranchState.failure(String message) = _Failure;
}
