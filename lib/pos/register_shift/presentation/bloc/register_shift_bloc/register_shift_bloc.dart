import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';

part 'register_shift_event.dart';
part 'register_shift_state.dart';
part 'register_shift_bloc.freezed.dart';

class RegisterShiftBloc extends Bloc<RegisterShiftEvent, RegisterShiftState> {
  final OpenRegisterShiftUseCase _openRegisterShiftUseCase;

  RegisterShiftBloc({required OpenRegisterShiftUseCase openRegisterShiftUseCase})
      : _openRegisterShiftUseCase = openRegisterShiftUseCase,
        super(const RegisterShiftState.initial()) {
    on<_OpenShift>(_onOpenShift);
  }

  Future<void> _onOpenShift(_OpenShift event, Emitter<RegisterShiftState> emit) async {
    emit(const RegisterShiftState.saving());

    try {
      final result = await _openRegisterShiftUseCase.call(event.amount);
      result.fold(
        (failure) => emit(RegisterShiftState.failure(failure.message)),
        (data) => emit(RegisterShiftState.success(data)),
      );
    } catch (e) {
      emit(RegisterShiftState.failure(e.toString()));
    }
  }
}
