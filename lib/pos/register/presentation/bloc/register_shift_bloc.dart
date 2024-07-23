import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/close_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/open_shift_usecase.dart';

part 'register_shift_event.dart';
part 'register_shift_state.dart';

class RegisterShiftBloc extends HydratedBloc<RegisterShiftEvent, RegisterShiftState> {
  final OpenShiftUseCase _openShiftUseCase;
  final CloseShiftUseCase _closeShiftUseCase;

  RegisterShiftBloc(this._openShiftUseCase, this._closeShiftUseCase) : super(RegisterShiftInitial()) {
    on<OpenRegisterShiftEvent>(_onOpenRegisterShift);
    on<CloseRegisterShiftEvent>(_onCloseRegisterShift);
    on<ClearRegisterShiftStateEvent>(_onClearRegisterShiftState);
  }

  Future<void> _onOpenRegisterShift(OpenRegisterShiftEvent event, emit) async {
    try {
      final result = await _openShiftUseCase.call(
        OpenShiftParams(
          RegisterShift(
            register: event.registerId,
            status: 'open',
            openingAmount: event.openingAmount,
          ),
        ),
      );
      result.fold(
        (error) => emit(RegisterShiftError(message: error.message)),
        (data) => emit(RegisterShiftOpen()),
      );
    } catch (e) {
      emit(RegisterShiftError(message: e.toString()));
    }
  }

  Future<void> _onCloseRegisterShift(CloseRegisterShiftEvent event, emit) async {
    try {
      final result = await _closeShiftUseCase.call(
        CloseShiftParams(
          RegisterShift(
            register: event.registerId,
            status: 'close',
            openingAmount: event.closingAmount,
          ),
        ),
      );
      result.fold(
        (error) => emit(RegisterShiftError(message: error.message)),
        (data) => emit(RegisterShiftOpen()),
      );
    } catch (e) {
      emit(RegisterShiftError(message: e.toString()));
    }
  }

  @override
  RegisterShiftState? fromJson(Map<String, dynamic> json) =>
      json['status'] == 'open' ? RegisterShiftOpen() : RegisterShiftClosed();

  @override
  Map<String, dynamic>? toJson(RegisterShiftState state) => {'status': state is RegisterShiftOpen ? 'open' : 'close'};

  Future<void> _onClearRegisterShiftState(event, emit) async {
    emit(RegisterShiftInitial());
    await super.clear();
  }
}
