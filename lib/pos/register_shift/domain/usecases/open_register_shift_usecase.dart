import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync_queue/sync_queue_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_service.dart';

class OpenRegisterShiftUseCase {
  final LocalRegisterShiftRepository _local;
  final RemoteRegisterShiftRepository _remote;
  final AppSessionService _session;
  final ConnectivityService _connection;
  final SyncQueueRepository _sync;

  const OpenRegisterShiftUseCase({
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

  Future<ApiResult<RegisterShift>> call(double amount) async {
    final userId = _session.userId;
    final registerId = _session.registerId;

    /// Get userId and registerId from AppSessionService
    try {
      if (userId == null || registerId == null) {
        return ApiResult.failure(UserNotFoundFailure('User and/or register details not found.'));
      }
    } catch (e) {
      return ApiResult.failure(
          UnexpectedFailure('Unexpected error occurred. Failed to get user and register details.'));
    }

    // Check if there's an open shift. If there's an open shift, restrict user from opening a new one
    final lookForOpenShift = await _local.getOpenShift(registerId);

    return lookForOpenShift.when(
      success: (openShift) async {
        if (openShift != null) {
          return ApiResult.failure(AlreadyExistsFailure(openShift, 'An open shift already exists.'));
        }

        // If there's no open shift, proceed to create a new one
        // Attach session info to the shift data
        final shift = RegisterShift(
          openingAmount: amount,
          userId: userId,
          registerId: registerId,
        );

        // Save the shift locally first and get the result.
        final localSave = await _local.openShift(shift);

        return localSave.when(
          // If successful, continue with remote sync logic.
          success: (shift) {
            final payload = shift.toOpenPayload();

            // Try to send to remote if online
            _connection.isOnline.then((online) {
              if (online) {
                // If online, attempt to send the shift to the remote server.
                // We use `.then()` instead of `await` to run this in the background,
                // allowing the main function to return immediately after saving locally.
                _remote.sendShift(shift.toOpenPayload()).then((result) {
                  result.when(
                    // If successful, do nothing — the shift is now synced.
                    success: (_) {},
                    // If remote send failed, add it to the sync queue for retry later.
                    failure: (failure) => _sync.enqueue(
                      itemId: shift.id!,
                      table: 'registerShifts',
                      data: payload,
                      error: failure.message,
                    ),
                  );
                });
              } else {
                // If offline, queue the shift for syncing later.
                _sync.enqueue(
                  itemId: shift.id!,
                  table: 'registerShifts',
                  data: payload,
                );
              }
            });

            // Return the successfully saved shift (from local DB).
            return ApiResult.success(shift);
          },
          // If saving locally failed, return the failure immediately.
          failure: (failure) => ApiResult.failure(failure),
        );
      },
      failure: (failure) => ApiResult.failure(failure),
    );

    //
    // // Save the shift locally first and get the result.
    // final localSave = await _local.openShift(shift);
    //
    // return localSave.fold(
    //   // If saving locally failed, return the failure immediately.
    //   (failure) => Left(failure),
    //
    //   // If successful, continue with remote sync logic.
    //   (shift) {
    //     final payload = shift.toOpenPayload();
    //
    //     // Try to send to remote if online
    //     _connection.isOnline.then((online) {
    //       if (online) {
    //         // If online, attempt to send the shift to the remote server.
    //         // We use `.then()` instead of `await` to run this in the background,
    //         // allowing the main function to return immediately after saving locally.
    //         // _remote.sendShift(RegisterShiftAction.open, shift).then((result) {
    //         //   result.fold(
    //         //     // If remote send failed, add it to the sync queue for retry later.
    //         //     (failure) => _sync.enqueue(
    //         //       itemId: shift.id!,
    //         //       table: 'registerShifts',
    //         //       data: payload,
    //         //       error: failure.message,
    //         //     ),
    //         //     // If successful, do nothing — the shift is now synced.
    //         //     (_) {},
    //         //   );
    //         // });
    //       } else {
    //         // If offline, queue the shift for syncing later.
    //         _sync.enqueue(
    //           itemId: shift.id!,
    //           table: 'registerShifts',
    //           data: payload,
    //         );
    //       }
    //     });
    //
    //     // Return the successfully saved shift (from local DB).
    //     return Right(shift);
    //   },
    // );
  }
}
