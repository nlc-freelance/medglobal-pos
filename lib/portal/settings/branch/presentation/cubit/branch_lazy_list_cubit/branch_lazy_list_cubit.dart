import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';

part 'branch_lazy_list_state.dart';

class BranchLazyListCubit extends Cubit<BranchLazyListState> {
  final BranchRepository _repository;

  BranchLazyListCubit(this._repository) : super(BranchLazyListState.initial());

  int _currentPage = 1;
  int _totalCount = -1;
  Set<Branch> _branches = {};

  void reset() {
    _branches = {};
    _currentPage = 1;
    emit(BranchLazyListState.initial());
  }

  Future<void> getBranches({String? search, bool isInitialSearch = false}) async {
    if (_branches.length != _totalCount) {
      if (isInitialSearch) {
        _branches = {};
        _currentPage = 1;
      }

      if (_currentPage == 1) {
        emit(state.copyWith(isInitLoading: true));
      } else {
        emit(state.copyWith(isLoadingMore: true));
      }

      try {
        final result = await _repository.getBranches(page: _currentPage);
        result.fold(
          (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
          (data) {
            _currentPage++;
            _branches = {..._branches, ...data.items};
            _totalCount = data.totalCount;
            emit(state.copyWith(
              isInitLoading: false,
              isLoadingMore: false,
              branches: _branches.toList(),
              hasNoData: data.hasNoItems,
              hasReachedMax: data.hasReachedMax,
            ));
          },
        );
      } catch (e) {
        emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: e.toString()));
      }
    }
  }
}
