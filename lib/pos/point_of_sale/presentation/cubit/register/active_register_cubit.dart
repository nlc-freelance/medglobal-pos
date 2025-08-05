import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift.dart';

part 'active_register_state.dart';

class ActiveRegisterCubit extends Cubit<ActiveRegisterState> {
  ActiveRegisterCubit() : super(ActiveRegisterState.initial());

  /// Loads the register and it's shift details from local storage to the [ActiveRegisterState]
  ///
  /// Triggered on every page reload
  Future<void> loadRegister() async {
    final register = await SharedPreferencesService.getRegisterDetails();

    emit(ActiveRegisterState(
      id: register['id'],
      name: register['name'],
      status: register['status'] == 'open' ? RegisterShiftStatus.open : RegisterShiftStatus.closed,
      openedAt: register['openedAt'],
      closedAt: register['closedAt'],
    ));
  }

  /// Saves selected register and it's shift details in local storage and [ActiveRegisterState]
  ///
  /// Called when user clicks [onConfirm] from the register selection dialog
  Future<void> saveRegister(Register register) async {
    await SharedPreferencesService.saveRegisterDetails(register);

    emit(ActiveRegisterState(
      id: register.id,
      name: register.name,
      status: register.shiftDetail?.status == 'open' ? RegisterShiftStatus.open : RegisterShiftStatus.closed,
      openedAt: register.shiftDetail?.createdAt,
      closedAt: register.shiftDetail?.updatedAt,
    ));
  }

  /// Updates the register shift details in local storage and [ActiveRegisterState]
  ///
  /// Triggered on every successful shift open/close API request
  Future<void> updateRegisterShift(RegisterShift shift) async {
    await SharedPreferencesService.updateRegisterShift(shift);

    emit(state.copyWith(
      status: shift.status == 'open' ? RegisterShiftStatus.open : RegisterShiftStatus.closed,
      openedAt: shift.createdAt,
      closedAt: shift.updatedAt,
    ));
  }

  void reset() => emit(ActiveRegisterState.initial());
}
