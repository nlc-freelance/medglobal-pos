import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  /// Loads the register and it's shift details from local storage to the [RegisterState]
  ///
  /// Triggered on every page reload
  Future<void> loadRegister() async {
    final register = await SharedPreferencesService.getRegisterDetails();

    emit(RegisterState(
      id: register['id'],
      name: register['name'],
      status: register['status'] == 'open' ? RegisterShiftStatus.open : RegisterShiftStatus.close,
      openedAt: register['openedAt'],
      closedAt: register['closedAt'],
    ));
  }

  /// Saves selected register and it's shift details in local storage and [RegisterState]
  ///
  /// Called when user clicks [onConfirm] from the register selection dialog
  Future<void> saveRegister(Register register) async {
    await SharedPreferencesService.saveRegisterDetails(register);

    emit(RegisterState(
      id: register.id,
      name: register.name,
      status: register.shiftDetail?.status == 'open' ? RegisterShiftStatus.open : RegisterShiftStatus.close,
      openedAt: register.shiftDetail?.createdAt,
      closedAt: register.shiftDetail?.updatedAt,
    ));
  }

  /// Updates the register shift details in local storage and [RegisterState]
  ///
  /// Triggered on every successful shift open/close API request
  Future<void> updateRegisterShift(RegisterShift shift) async {
    await SharedPreferencesService.updateRegisterShift(shift);

    emit(state.copyWith(
      status: shift.status == 'open' ? RegisterShiftStatus.open : RegisterShiftStatus.close,
      openedAt: shift.createdAt,
      closedAt: shift.updatedAt,
    ));
  }

  void reset() => emit(RegisterState.initial());
}
