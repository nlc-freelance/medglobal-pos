import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/sync_queue_repository.dart';

import '../entities/register_shift.dart';
import '../repositories/local_register_shift_repository.dart';

class CloseRegisterShiftUseCase {
  final LocalRegisterShiftRepository _local;
  final RemoteRegisterShiftRepository _remote;
  final AppSessionService _session;
  final ConnectivityService _connection;
  final SyncQueueRepository _sync;

  const CloseRegisterShiftUseCase({
    required LocalRegisterShiftRepository local,
    required RemoteRegisterShiftRepository remote,
    required AppSessionService session,
    required ConnectivityService connection,
    required SyncQueueRepository sync,
  })  : _local = local,
        _remote = remote,
        _session = session,
        _connection = connection,
        _sync = sync;

  Future<Either<Failure, RegisterShift>> call(int shiftId, double amount) async {
    final userId = _session.userId;
    final registerId = _session.registerId;

    /// Get userId and registerId from AppSessionService
    try {
      if (userId == null || registerId == null) {
        return Left(UserNotFoundFailure('User and/or register details not found.'));
      }
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error occurred. Failed to get user and register details.'));
    }

    final localResult = await _local.closeShift(shiftId, amount);

    return localResult.fold(
      (failure) => Left(failure),
      (shift) {
        // Try to send to remote if online
        _connection.isOnline.then((online) {
          if (online) {
            // If online, attempt to send the shift to the remote server.
            // We use `.then()` instead of `await` to run this in the background,
            // allowing the main function to return immediately after saving locally.
            _remote.sendShift(shift.toClosePayload()).then((result) {
              result.fold(
                // If remote send failed, add it to the sync queue for retry later.
                (failure) => _sync.enqueue(
                  itemId: shift.id!,
                  table: 'registerShifts',
                  data: shift.toClosePayload(),
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
              data: shift.toClosePayload(),
            );
          }
        });

        // Return the successfully saved shift (from local DB).
        return Right(shift);
      },
    );
  }
}
