import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';

class GetLastClosedRegisterShiftUseCase {
  final LocalRegisterShiftRepository _local;
  final AppSessionService _session;

  const GetLastClosedRegisterShiftUseCase({
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

    final result = await _local.getLastClosedShift(registerId);

    return result.when(
      success: (lastClosedShift) => ApiResult.success(lastClosedShift),
      failure: (failure) => ApiResult.failure(failure),
    );
  }
}
