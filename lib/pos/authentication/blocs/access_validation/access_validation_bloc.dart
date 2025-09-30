import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/settings/local_settings_repository.dart';

part 'access_validation_event.dart';
part 'access_validation_state.dart';
part 'access_validation_bloc.freezed.dart';

class AccessValidationBloc extends Bloc<AccessValidationEvent, AccessValidationState> {
  AccessValidationBloc() : super(const AccessValidationState.initial()) {
    on<_Started>(_onAccessValidate);
  }

  Future<void> _onAccessValidate(_Started event, Emitter<AccessValidationState> emit) async {
    emit(const AccessValidationState.loading());

    try {
      final result = await GetIt.I<EmployeeRepository>().getEmployee(event.userId);

      final deviceSettings = await GetIt.I<LocalSettingsRepository>().getSettings();

      BranchPartial? branch;

      deviceSettings.fold(
        (failure) => emit(AccessValidationState.failure(failure.message)),
        (settings) => branch = settings?.branch,
      );

      result.fold(
        (failure) => emit(AccessValidationState.failure(failure.message)),
        (employee) {
          final user = employee.toUser();

          if (branch == null) {
            emit(AccessValidationState.granted(user));
            return;
          }

          final isUserAssignedToThisBranch = employee.assignedBranches.any((userBranch) => userBranch.id == branch?.id);

          if (isUserAssignedToThisBranch) {
            emit(AccessValidationState.granted(user));
          } else {
            emit(AccessValidationState.denied(
              'This device is linked to ${branch?.name}, but your account is not assigned to this branch. Please contact your administrator or support for assistance.',
            ));
          }
        },
      );
    } catch (e) {
      emit(AccessValidationState.failure(e.toString()));
    }
  }
}
