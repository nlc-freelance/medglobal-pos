part of 'branch_bloc.dart';

@freezed
class BranchState with _$BranchState {
  const factory BranchState.initial() = _Initial;
  const factory BranchState.loading() = _Loading;
  // Success state for getById, create and update
  const factory BranchState.success(Branch1 branch, {@Default('') String message}) = _Success;
  const factory BranchState.deleted(String message) = _Deleted;
  const factory BranchState.failure(String message) = _Failure;
}
