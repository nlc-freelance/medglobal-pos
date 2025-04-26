import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_shift_repository.dart';

part 'register_shift_event.dart';
part 'register_shift_state.dart';

class RegisterShiftBloc extends Bloc<RegisterShiftEvent, RegisterShiftState> {
  final RegisterShiftRepository _repository;

  RegisterShiftBloc(this._repository) : super(RegisterShiftInitial()) {
    on<RegisterShiftOpened>(_onShiftOpened);
    on<RegisterShiftClosed>(_onShiftClosed);
  }

  Future<void> _onShiftOpened(event, emit) async {
    emit(RegisterShiftLoading());

    try {
      final id = await SharedPreferencesService.getRegisterId();

      final result = await _repository.openShift(registerId: id!, amount: event.amount);
      result.fold(
        (error) => emit(RegisterShiftError(message: error.message)),
        (data) => emit(RegisterShiftSuccess(shift: data)),
      );
    } catch (e) {
      emit(RegisterShiftError(message: e.toString()));
    }
  }

  Future<void> _onShiftClosed(event, emit) async {
    emit(RegisterShiftLoading());

    try {
      final id = await SharedPreferencesService.getRegisterId();

      final result = await _repository.closeShift(registerId: id!, amount: event.amount);
      result.fold(
        (error) => emit(RegisterShiftError(message: error.message)),
        (data) => emit(RegisterShiftSuccess(shift: data)),
      );
    } catch (e) {
      emit(RegisterShiftError(message: e.toString()));
    }
  }
}
