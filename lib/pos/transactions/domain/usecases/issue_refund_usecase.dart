import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/helper/branch_code.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync_queue/sync_queue_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund/local_refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund/remote_refund_repository.dart';
import 'package:ulid/ulid.dart';

// Hide offline support for refund for now
class IssueRefundUseCase {
  final LocalRegisterShiftRepository _localRegisterShiftRepository;
  final LocalRefundRepository _local;
  final RemoteRefundRepository _remote;
  final AppSessionService _appContext;
  final ConnectivityService _connection;
  final SyncQueueRepository _syncQueue;

  const IssueRefundUseCase({
    required LocalRegisterShiftRepository localRegisterShiftRepository,
    required LocalRefundRepository local,
    required RemoteRefundRepository remote,
    required AppSessionService appContext,
    required ConnectivityService connection,
    required SyncQueueRepository syncQueue,
  })  : _localRegisterShiftRepository = localRegisterShiftRepository,
        _local = local,
        _remote = remote,
        _appContext = appContext,
        _connection = connection,
        _syncQueue = syncQueue;

  Future<ApiResult<Transaction>> call({
    required Transaction saleTransaction,
    required List<RefundItem> items,
    required String? reasonForRefund,
  }) async {
    // Validate inputs
    if (items.isEmpty) {
      return ApiResult.failure(UnexpectedFailure('Add a refund quantity to at least one item to continue.'));
    }

    if (items.hasInvalidRefundQuantity()) {
      return ApiResult.failure(UnexpectedFailure('Refund quantities cannot be greater than the sold quantity.'));
    }

    // Load and validate session
    final session = _appContext.session;

    if (session == null) {
      return ApiResult.failure(UserNotFoundFailure('App session not loaded.'));
    }

    if (saleTransaction.branch.id != session.branchId) {
      return ApiResult.failure(
          UnexpectedFailure('Could not issue refund. This transaction did not come from this branch.'));
    }

    // Check if there's an open shift
    final validateOpenShift = await _localRegisterShiftRepository.getOpenShift(session.registerId);

    return validateOpenShift.when(
      success: (openShift) async {
        if (openShift == null) {
          return ApiResult.failure(
              UnexpectedFailure('There is no open shift. Cannot issue a refund without an open shift.'));
        }

        // If there's an open shift, proceed to create the refund
        final refundTransaction = Transaction(
          id: -1, // Placeholder
          receiptId: 'MG-${branchCode(session.branchName)}-${Ulid().toString().toUpperCase()}',
          saleTransactionId: saleTransaction.id,
          saleTransactionReceiptId: saleTransaction.receiptId,
          type: TransactionType.refund,
          status: ReturnStatus.awaitingAction,
          register: RegisterPartial(id: session.registerId, name: session.registerName),
          branch: BranchPartial(id: session.branchId, name: session.branchName),
          employee: EmployeePartial(
            id: session.employeeId,
            firstName: session.employeeFirstName,
            lastName: session.employeeLastName,
          ),
          subtotal: items.getRefundSubtotal(),
          totalDiscountAmount: items.getRefundTotalDiscountAmount(),
          total: items.getRefundTotal(),
          reasonForRefund: reasonForRefund,
          createdAt: DateTime.now(),
        );

        final payload = CreateRefundDto(
          registerId: refundTransaction.register.id,
          saleTransactionId: refundTransaction.saleTransactionId!,
          items: items
              .map((item) => CreateRefundItemDto(
                    variantId: item.id,
                    quantity: item.refundQuantity!,
                  ))
              .toList(),
          notes: refundTransaction.reasonForRefund,
        );

        final result = await _remote.createRefund(payload);

        return result.when(
          success: (transaction) => ApiResult.success(transaction),
          failure: (failure) => ApiResult.failure(failure),
        );

        // // Save the refund locally first and get the result.
        // final localSave = await _local.createRefund(refundTransaction, items);
        //
        // return localSave.fold(
        //   // If saving locally failed, return the failure immediately.
        //   (failure) => Left(failure),
        //
        //   // If successful, continue with remote sync logic.
        //   (transaction) {
        //     final payload = CreateRefundDto(
        //       registerId: transaction.register.id,
        //       saleTransactionId: transaction.saleTransactionId!,
        //       items: items
        //           .map((item) => CreateRefundItemDto(
        //                 variantId: item.id,
        //                 quantity: item.refundQuantity!,
        //               ))
        //           .toList(),
        //       notes: transaction.reasonForRefund,
        //     );
        //
        //   // Try to send to remote if online
        //   _connection.isOnline.then((online) {
        //     if (online) {
        //       // If online, attempt to send the transaction to the remote server.
        //       // We use `.then()` instead of `await` to run this in the background,
        //       // allowing the main function to return immediately after saving locally.
        //       _remote.createRefund(payload).then((result) {
        //         result.fold(
        //           // If remote send failed, add it to the sync queue for retry later.
        //           (failure) => _syncQueue.enqueue(
        //             itemId: transaction.id,
        //             table: 'refunds',
        //             data: payload.toJson(),
        //             error: failure.message,
        //           ),
        //           // If successful, do nothing — the shift is now synced.
        //           (_) {},
        //         );
        //       });
        //     } else {
        //       // If offline, queue the shift for syncing later.
        //       _syncQueue.enqueue(
        //         itemId: transaction.id,
        //         table: 'refunds',
        //         data: payload.toJson(),
        //       );
        //     }
        //   });
        //
        //   // Return the successfully saved transaction (from local DB).
        //   return Right(transaction);
        // },
        // );
      },
      failure: (failure) => ApiResult.failure(failure),
    );
  }
}
