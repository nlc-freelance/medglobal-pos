import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';

import '../entities/register_shift.dart';
import '../repositories/local_register_shift_repository.dart';

class GetLastClosedRegisterShiftUseCase {
  final LocalRegisterShiftRepository _local;
  final AppSessionService _session;

  const GetLastClosedRegisterShiftUseCase({
    required LocalRegisterShiftRepository local,
    required AppSessionService session,
  })  : _local = local,
        _session = session;

  Future<Either<Failure, RegisterShift?>> call() async {
    final userId = _session.userId;
    final registerId = _session.registerId;

    /// Get userId and registerId from AppSessionService
    try {
      if (registerId == null) {
        // if (userId == null || registerId == null) { // No locking of register shift to a user
        return Left(UserNotFoundFailure('Register details not found.'));
      }
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error occurred. Failed to get user and register details.'));
    }

    final result = await _local.getLastClosedShift(registerId);

    return result.fold(
      (failure) => Left(failure),
      (lastClosedShift) => Right(lastClosedShift),
    );
  }
}
