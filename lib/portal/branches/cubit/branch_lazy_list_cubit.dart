import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/usecases/get_branches_usecase.dart';

part 'branch_lazy_list_state.dart';

class BranchLazyListCubit extends Cubit<BranchLazyListState> {
  final GetBranchesUseCase _getBranchesUseCase;

  BranchLazyListCubit(this._getBranchesUseCase) : super(BranchLazyListState.initial());

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
        final result = await _getBranchesUseCase.call(GetBranchesParams(page: _currentPage));
        result.fold(
          (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
          (data) {
            _currentPage++;
            _branches = {..._branches, ...?data.branches};
            _totalCount = data.totalCount!;
            emit(state.copyWith(
              isInitLoading: false,
              isLoadingMore: false,
              branches: _branches.toList(),
              hasNoData: data.totalCount == 0 && data.branches?.isEmpty == true,
              hasReachedMax: data.currentPage == data.totalPages,
            ));
          },
        );
      } catch (e) {
        emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: e.toString()));
      }
    }
  }
}
