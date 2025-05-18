import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';

part 'register_lazy_list_state.dart';

class RegisterLazyListCubit extends Cubit<RegisterLazyListState> {
  final RegisterRepository _repository;

  RegisterLazyListCubit(this._repository) : super(RegisterLazyListState.initial());

  int _currentPage = 1;
  int _totalCount = -1;
  Set<Register> registers = {};

  void reset() {
    registers = {};
    _currentPage = 1;
    emit(RegisterLazyListState.initial());
  }

  Future<void> getRegisters() async {
    if (registers.length != _totalCount) {
      if (_currentPage == 1) {
        emit(state.copyWith(isInitLoading: true));
      } else {
        emit(state.copyWith(isLoadingMore: true));
      }

      try {
        final result = await _repository.getRegisters(page: _currentPage, size: 10);
        result.fold(
          (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
          (data) {
            _currentPage++;
            registers = {...registers, ...data.items};
            _totalCount = data.totalCount;
            emit(state.copyWith(
              isInitLoading: false,
              isLoadingMore: false,
              registers: registers.toList(),
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
