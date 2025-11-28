import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';

class CheckForOpenRegisterShiftUseCase {
  final LocalRegisterShiftRepository _local;
  final AppSessionService _session;

  const CheckForOpenRegisterShiftUseCase({
    required LocalRegisterShiftRepository local,
    required AppSessionService session,
  })  : _local = local,
        _session = session;

  Future<ApiResult<RegisterShift?>> call() async {
    final registerId = _session.registerId;

    /// Get registerId from AppSessionService
    try {
      if (registerId == null) {
        return ApiResult.failure(UserNotFoundFailure('Register details not found.'));
      }
    } catch (e) {
      return ApiResult.failure(
          UnexpectedFailure('Unexpected error occurred. Failed to get user and register details.'));
    }

    /// Query the local repository to check for an open shift.
    final result = await _local.getOpenShift(registerId);

    return result.when(
      success: (openShift) {
        // // If open shift is found, return it immediately.
        if (openShift != null) return ApiResult.success(openShift);

        return const ApiResult.success(null);
      },
      failure: (failure) => ApiResult.failure(failure),
    );
  }
}
