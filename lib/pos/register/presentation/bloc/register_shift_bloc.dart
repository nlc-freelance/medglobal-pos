import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/register_shift/close_shift_usecase.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/register_shift/open_shift_usecase.dart';

part 'register_shift_event.dart';
part 'register_shift_state.dart';

class RegisterShiftBloc extends HydratedBloc<RegisterShiftEvent, RegisterShiftState> {
  final OpenShiftUseCase _openShiftUseCase;
  final CloseShiftUseCase _closeShiftUseCase;

  RegisterShiftBloc(this._openShiftUseCase, this._closeShiftUseCase) : super(RegisterShiftInitial()) {
    on<OpenRegisterShiftEvent>(_onOpenRegisterShift);
    on<CloseRegisterShiftEvent>(_onCloseRegisterShift);
    on<ShowClosingShiftDialogEvent>(_onShowClosingShiftDialog);
    on<HideClosingShiftDialogEvent>(_onHideClosingShiftDialog);
    on<ResetRegisterShiftOnLogoutEvent>(_reset);
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
          if (error.message.contains('once a day')) _setHasReachedMaxShiftOpen();
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
    final openSince = DateTime.parse(await SharedPreferencesService.getShiftOpenSince());
    emit(ShowClosingShiftDialog(openSince: openSince));
  }

  void _onHideClosingShiftDialog(event, emit) async {
    final isOpen = await SharedPreferencesService.isShiftOpen();
    emit(isOpen ? RegisterShiftOpen() : RegisterShiftClose());
  }

  void _setShiftOpenDetails(RegisterShift data) async {
    await SharedPreferencesService.setShiftOpenAt(data.createdAt!.toIso8601String());
    await SharedPreferencesService.setShiftStatus(true);
  }

  void _setShiftCloseDetails(RegisterShift data) async {
    await SharedPreferencesService.setShiftClosedAt(data.updatedAt!.toIso8601String());
    await SharedPreferencesService.setShiftStatus(false);
  }

  void _setHasReachedMaxShiftOpen() async => await SharedPreferencesService.setHasReachedMaxShiftOpen(true);

  void _reset(event, emit) => emit(RegisterShiftInitial());

  @override
  RegisterShiftState? fromJson(Map<String, dynamic> json) {
    switch (json['state']) {
      case 'RegisterShiftLoading()':
        return RegisterShiftLoading();
      case 'RegisterShiftOpen()':
        return RegisterShiftOpen();
      case 'RegisterShiftClose()':
        return RegisterShiftClose();
      case 'RegisterShiftError()':
        return RegisterShiftError(message: json['message']);
      default:
        return RegisterShiftInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(RegisterShiftState state) {
    return {'state': state.toString(), 'message': state is RegisterShiftError ? state.message : null};
  }
}
