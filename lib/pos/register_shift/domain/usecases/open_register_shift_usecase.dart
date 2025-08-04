import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/device_register/pos_session_service.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/sync_queue_repository.dart';

import '../entities/register_shift.dart';
import '../repositories/local_register_shift_repository.dart';

class OpenRegisterShiftUseCase {
  final LocalRegisterShiftRepository _local;
  final RemoteRegisterShiftRepository _remote;
  final UserSessionService _session;
  final ConnectivityService _connection;
  final SyncQueueRepository _sync;

  const OpenRegisterShiftUseCase({
    required LocalRegisterShiftRepository local,
    required RemoteRegisterShiftRepository remote,
    required UserSessionService session,
    required ConnectivityService connection,
    required SyncQueueRepository sync,
  })  : _local = local,
        _remote = remote,
        _session = session,
        _connection = connection,
        _sync = sync;

  Future<Either<Failure, RegisterShift>> call(double amount) async {
    int? userId;
    int? registerId;

    /// Get userId and registerId from UserSessionService
    try {
      userId = _session.userId;
      registerId = _session.registerId;

      if (userId == null || registerId == null) {
        throw Left(UserNotFoundFailure('User and/or register details not found.'));
      }
    } catch (e) {
      throw Left(UnexpectedFailure('Unexpected error occurred. Failed to get user and register details.'));
    }

    // Attach session info to the shift data
    final shift = RegisterShift(
      openingAmount: amount,
      userId: userId,
      registerId: registerId,
    );

    // Save the shift locally first and get the result.
    final localResult = await _local.openShift(shift);

    return localResult.fold(
      // If saving locally failed, return the failure immediately.
      (failure) => Left(failure),

      // If successful, continue with remote sync logic.
      (shift) {
        // Try to send to remote if online
        _connection.isOnline.then((online) {
          if (online) {
            // If online, attempt to send the shift to the remote server.
            // We use `.then()` instead of `await` to run this in the background,
            // allowing the main function to return immediately after saving locally.
            _remote.sendShift(shift).then((result) {
              result.fold(
                // If remote send failed, add it to the sync queue for retry later.
                (failure) => _sync.enqueue(
                  itemId: shift.id!,
                  table: 'registerShifts',
                  data: shift.toOpenPayload(),
                  error: failure.message,
                ),
                // If successful, do nothing — the shift is now synced.
                (_) {},
              );
            });
          } else {
            // If offline, queue the shift for syncing later.
            _sync.enqueue(
              itemId: shift.id!,
              table: 'registerShifts',
              data: shift.toOpenPayload(),
            );
          }
        });

        // Return the successfully saved shift (from local DB).
        return Right(shift);
      },
    );
  }
}
