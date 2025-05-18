part of 'branch_bloc.dart';

@freezed
class BranchState with _$BranchState {
  const factory BranchState.initial() = _BranchInitial;

  // Fetch by id
  const factory BranchState.loading() = _BranchFetching;
  const factory BranchState.loaded(Branch branch) = _BranchLoaded;
  const factory BranchState.loadFailed(String message) = _BranchLoadFailed;

  // Create, update, delete
  const factory BranchState.submitting() = _BranchLoading;
  const factory BranchState.success(String message) = _BranchSuccess;
  const factory BranchState.failure(String message) = _BranchFailure;
}
