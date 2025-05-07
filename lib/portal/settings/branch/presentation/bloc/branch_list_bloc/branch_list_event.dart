part of 'branch_list_bloc.dart';

@freezed
class BranchListEvent with _$BranchListEvent {
  const factory BranchListEvent.getBranches({int? page, int? size}) = _GetBranches;
}
