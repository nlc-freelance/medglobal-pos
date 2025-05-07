part of 'branch_list_bloc.dart';

@freezed
class BranchListState with _$BranchListState {
  const factory BranchListState.initial() = _Initial;
  const factory BranchListState.loading() = _Loading;
  const factory BranchListState.success(PaginatedList<Branch1> data) = _Success;
  const factory BranchListState.empty() = _Empty;
  const factory BranchListState.failure(String message) = _Failure;
}
