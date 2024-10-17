import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register.dart';
import 'package:medglobal_admin_portal/shared/register/domain/usecases/get_registers_usecase.dart';

part 'register_lazy_list_state.dart';

class RegisterLazyListCubit extends Cubit<RegisterLazyListState> {
  final GetRegistersUseCase _getRegistersUseCase;
  RegisterLazyListCubit(this._getRegistersUseCase) : super(RegisterLazyListState.initial());

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
        final result = await _getRegistersUseCase.call(GetRegistersParams(page: _currentPage));
        result.fold(
          (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
          (data) {
            _currentPage++;
            registers = {...registers, ...?data.registers};
            _totalCount = data.totalCount!;
            emit(state.copyWith(
              isInitLoading: false,
              isLoadingMore: false,
              registers: registers.toList(),
              hasNoData: data.totalCount == 0 && data.registers?.isEmpty == true,
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
