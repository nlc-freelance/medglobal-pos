import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/shared/register/domain/usecases/register_shift/close_shift_usecase.dart';
import 'package:medglobal_admin_portal/shared/register/domain/usecases/register_shift/open_shift_usecase.dart';

part 'register_shift_event.dart';
part 'register_shift_state.dart';

class RegisterShiftBloc extends Bloc<RegisterShiftEvent, RegisterShiftState> {
  final OpenShiftUseCase _openShiftUseCase;
  final CloseShiftUseCase _closeShiftUseCase;

  RegisterShiftBloc(this._openShiftUseCase, this._closeShiftUseCase) : super(RegisterShiftInitial()) {
    on<OpenRegisterShiftEvent>(_onOpenRegisterShift);
    on<CloseRegisterShiftEvent>(_onCloseRegisterShift);
    on<ShowOpeningShiftDialogEvent>(_onShowOpeningShiftDialog);
    on<HideOpeningShiftDialogEvent>(_onHideOpeningShiftDialog);
    on<ShowClosingShiftDialogEvent>(_onShowClosingShiftDialog);
    on<HideClosingShiftDialogEvent>(_onHideClosingShiftDialog);
    on<SetShiftAsOpenOnLoginEvent>(_setRegisterShiftOpenOnLogin);
    on<SetShiftAsClosedOnLoginEvent>(_setRegisterShiftClosedOnLogin);
    on<SetShiftAsClosedOnFirstTimeEvent>(_setRegisterShiftClosedOnFirstTime);
    on<ResetRegisterShiftOnLogoutEvent>(_reset);
  }

  Future<void> _setRegisterShiftOpenOnLogin(SetShiftAsOpenOnLoginEvent event, emit) async {
    await SharedPreferencesService.setShiftLastOpenedAt(event.shiftDetail.createdAt!.toIso8601String());
    await SharedPreferencesService.setShiftStatus(true);
    emit(RegisterShiftOpen());
  }

  Future<void> _setRegisterShiftClosedOnLogin(SetShiftAsClosedOnLoginEvent event, emit) async {
    await SharedPreferencesService.setShiftLastClosedAt(event.shiftDetail.updatedAt!.toIso8601String());
    await SharedPreferencesService.setShiftStatus(false);
    emit(RegisterShiftClose());
  }

  Future<void> _setRegisterShiftClosedOnFirstTime(event, emit) async {
    /// If the register is newly added or does not have an existing shift record yet (shiftDetail == null),
    /// the state should be treated as the initial where there's no preferences yet for shift and the shift is closed
    await SharedPreferencesService.clearShiftStatus();
    await SharedPreferencesService.clearShiftOpenedAt();
    await SharedPreferencesService.clearShiftLastClosedAt();
    emit(RegisterShiftClose());
  }

  Future<void> _onOpenRegisterShift(OpenRegisterShiftEvent event, emit) async {
    emit(RegisterShiftLoading());

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
        (error) {
          emit(RegisterShiftError(message: error.message));
        },
        (data) {
          _setShiftOpenDetails(data);
          emit(RegisterShiftOpen());
        },
      );
    } catch (e) {
      emit(RegisterShiftError(message: e.toString()));
    }
  }

  Future<void> _onCloseRegisterShift(CloseRegisterShiftEvent event, emit) async {
    emit(RegisterShiftLoading());

    try {
      final result = await _closeShiftUseCase.call(
        CloseShiftParams(
          RegisterShift(
            register: event.registerId,
            status: 'close',
            closingAmount: event.closingAmount,
          ),
        ),
      );
      result.fold(
        (error) => emit(RegisterShiftError(message: error.message)),
        (data) {
          _setShiftCloseDetails(data);
          emit(RegisterShiftClose());
        },
      );
    } catch (e) {
      emit(RegisterShiftError(message: e.toString()));
    }
  }

  Future<void> _onShowClosingShiftDialog(ShowClosingShiftDialogEvent event, emit) async {
    final lastOpenedAt = DateTime.parse(await SharedPreferencesService.getShiftLastOpenedAt());
    emit(ShowClosingShiftDialog(lastOpenedAt: lastOpenedAt));
  }

  Future<void> _onHideClosingShiftDialog(HideClosingShiftDialogEvent event, emit) async {
    final isOpen = await SharedPreferencesService.isShiftOpen();
    emit(isOpen ? RegisterShiftOpen() : RegisterShiftClose());
  }

  Future<void> _onShowOpeningShiftDialog(ShowOpeningShiftDialogEvent event, emit) async {
    final lastClosedAt = DateTime.tryParse(await SharedPreferencesService.getShiftLastClosedAt());
    emit(ShowOpeningShiftDialog(lastClosedAt: lastClosedAt));
  }

  Future<void> _onHideOpeningShiftDialog(HideOpeningShiftDialogEvent event, emit) async {
    final isOpen = await SharedPreferencesService.isShiftOpen();
    emit(isOpen ? RegisterShiftOpen() : RegisterShiftClose());
  }

  void _setShiftOpenDetails(RegisterShift data) async {
    await SharedPreferencesService.setShiftLastOpenedAt(data.createdAt!.toIso8601String());
    await SharedPreferencesService.setShiftStatus(true);
  }

  void _setShiftCloseDetails(RegisterShift data) async {
    await SharedPreferencesService.setShiftLastClosedAt(data.updatedAt!.toIso8601String());
    await SharedPreferencesService.setShiftStatus(false);
  }

  void _reset(event, emit) => emit(RegisterShiftInitial());
}
