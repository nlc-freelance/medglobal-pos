import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/check_for_open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/close_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/get_last_closed_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/usecases/open_register_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';

part 'register_shift_event.dart';
part 'register_shift_state.dart';
part 'register_shift_bloc.freezed.dart';

class RegisterShiftBloc extends Bloc<RegisterShiftEvent, RegisterShiftState> {
  final OpenRegisterShiftUseCase _openRegisterShiftUseCase;
  final CheckForOpenRegisterShiftUseCase _checkForOpenRegisterShiftUseCase;
  final GetLastClosedRegisterShiftUseCase _getLastClosedRegisterShiftUseCase;
  final CloseRegisterShiftUseCase _closeRegisterShiftUseCase;

  RegisterShiftBloc({
    required OpenRegisterShiftUseCase openRegisterShiftUseCase,
    required CheckForOpenRegisterShiftUseCase checkForOpenRegisterShiftUseCase,
    required GetLastClosedRegisterShiftUseCase getLastClosedRegisterShiftUseCase,
    required CloseRegisterShiftUseCase closeRegisterShiftUseCase,
  })  : _openRegisterShiftUseCase = openRegisterShiftUseCase,
        _checkForOpenRegisterShiftUseCase = checkForOpenRegisterShiftUseCase,
        _getLastClosedRegisterShiftUseCase = getLastClosedRegisterShiftUseCase,
        _closeRegisterShiftUseCase = closeRegisterShiftUseCase,
        super(const RegisterShiftState.initial()) {
    on<_CheckForOpenShift>(_checkForOpenShift);
    on<_GetLastClosedShift>(_getLastClosedShift);
    on<_OpenShift>(_onOpenShift);
    on<_CloseShift>(_onCloseShift);
  }

  /// Call on app startup to determine the shift state.
  ///
  /// This checks whether there's an open shift:
  /// - If found, emits [RegisterShiftState.open].
  /// - If not, emits [RegisterShiftState.closed] with `null`,
  ///   and then triggers a background event [_GetLastClosedShift]
  ///   to fetch when the last shift was closed (for datetime display).
  Future<void> _checkForOpenShift(_CheckForOpenShift event, Emitter<RegisterShiftState> emit) async {
    emit(const RegisterShiftState.loading());

    try {
      final result = await _checkForOpenRegisterShiftUseCase.call();

      result.when(
        success: (openShift) {
          // If an open shift is found, emit open state.
          if (openShift != null) {
            emit(RegisterShiftState.open(openShift));
          } else {
            // Emit state without blocking
            emit(const RegisterShiftState.closed(null));

            // Dispatch event for checking the last closed shift (in background).
            add(const _GetLastClosedShift());
          }
        },
        failure: (failure) => emit(RegisterShiftState.failure(failure.message)),
      );
    } catch (e) {
      emit(RegisterShiftState.failure(e.toString()));
    }
  }

  /// Handles background fetching of the last closed shift.
  /// Triggered only when no open shift was found during app startup.
  Future<void> _getLastClosedShift(_GetLastClosedShift event, Emitter<RegisterShiftState> emit) async {
    try {
      final result = await _getLastClosedRegisterShiftUseCase.call();

      result.when(
        // Emit closed state with the last closed timestamp, if available.
        success: (lastShift) => emit(RegisterShiftState.closed(lastShift?.closedAt)),
        // If last closed shift fetch fails, still emit closed state with null.
        failure: (_) => emit(const RegisterShiftState.closed(null)),
      );
    } catch (e) {
      emit(RegisterShiftState.failure(e.toString()));
    }
  }

  Future<void> _onOpenShift(_OpenShift event, Emitter<RegisterShiftState> emit) async {
    emit(const RegisterShiftState.loading());

    try {
      final result = await _openRegisterShiftUseCase.call(event.amount);
      result.when(
        success: (data) => emit(RegisterShiftState.open(data)),
        failure: (failure) {
          if (failure is AlreadyExistsFailure<RegisterShift>) {
            emit(RegisterShiftState.open(failure.data, message: failure.message));
            return;
          }
          emit(RegisterShiftState.failure(failure.message));
        },
      );
    } catch (e) {
      emit(RegisterShiftState.failure(e.toString()));
    }
  }

  Future<void> _onCloseShift(_CloseShift event, Emitter<RegisterShiftState> emit) async {
    emit(const RegisterShiftState.loading());

    try {
      final result = await _closeRegisterShiftUseCase.call(event.shiftId, event.amount);
      result.when(
        success: (shift) => emit(RegisterShiftState.closed(shift.closedAt)),
        failure: (failure) => emit(RegisterShiftState.failure(failure.message)),
      );
    } catch (e) {
      emit(RegisterShiftState.failure(e.toString()));
    }
  }
}
