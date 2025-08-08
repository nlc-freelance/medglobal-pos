import 'package:dartz/dartz.dart' hide Order;
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/sync_queue_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/local_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class CreateSaleUseCase {
  final LocalRegisterShiftRepository _localRegisterShiftRepository;
  final LocalSaleRepository _local;
  final RemoteSaleRepository _remote;
  final AppSessionService _appSessionService;
  final ConnectivityService _connection;
  final SyncQueueRepository _sync;

  const CreateSaleUseCase({
    required LocalRegisterShiftRepository localRegisterShiftRepository,
    required LocalSaleRepository local,
    required RemoteSaleRepository remote,
    required AppSessionService appSessionService,
    required ConnectivityService connection,
    required SyncQueueRepository sync,
  })  : _localRegisterShiftRepository = localRegisterShiftRepository,
        _local = local,
        _remote = remote,
        _appSessionService = appSessionService,
        _connection = connection,
        _sync = sync;

  Future<Either<Failure, Transaction>> call(Order cart, double? amountPaid) async {
    /// Check amountPaid
    if (amountPaid == null || amountPaid == 0) {
      return Left(UnexpectedFailure('Please enter the amount received to proceed with the transaction.'));
    }

    if (amountPaid < cart.grandTotal()) {
      return Left(UnexpectedFailure('Received amount is less than the total amount due.'));
    }

    /// Get app session from AppSessionService
    final session = _appSessionService.session;

    try {
      if (session == null) {
        return Left(UserNotFoundFailure('App session details not found.'));
      }
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error occurred. Failed to app session details.'));
    }

    // Check if there's an open shift
    final validateOpenShift = await _localRegisterShiftRepository.getOpenShift(session.employeeId, session.registerId);

    return validateOpenShift.fold(
      (failure) => Left(failure),
      (openShift) async {
        if (openShift == null) {
          return Left(UnexpectedFailure('There is no open shift. Transactions cannot be made without an open shift.'));
        }

        // If there's an open shift, proceed to create the order
        final order = cart.copyWith(total: cart.grandTotal(), amountPaid: amountPaid);

        // Save the order locally first and get the result.
        final localSave = await _local.createSale(order, session);

        return localSave.fold(
          // If saving locally failed, return the failure immediately.
          (failure) => Left(failure),

          // If successful, continue with remote sync logic.
          (transaction) {
            final payload = OrderPayload.fromDomain(
              session.registerId,
              order,
              transaction.receiptId,
              transaction.createdAt.millisecondsSinceEpoch,
            ).toJson();

            // Try to send to remote if online
            _connection.isOnline.then((online) {
              if (online) {
                // If online, attempt to send the transaction to the remote server.
                // We use `.then()` instead of `await` to run this in the background,
                // allowing the main function to return immediately after saving locally.
                _remote.createSale(payload).then((result) {
                  result.fold(
                    // If remote send failed, add it to the sync queue for retry later.
                    (failure) => _sync.enqueue(
                      itemId: transaction.id,
                      table: 'transactions',
                      data: payload,
                      error: failure.message,
                    ),
                    // If successful, do nothing — the shift is now synced.
                    (_) {},
                  );
                });
              } else {
                // If offline, queue the shift for syncing later.
                _sync.enqueue(
                  itemId: transaction.id,
                  table: 'transactions',
                  data: payload,
                );
              }
            });

            // Return the successfully saved transaction (from local DB).
            return Right(transaction);
          },
        );
      },
    );
  }
}
