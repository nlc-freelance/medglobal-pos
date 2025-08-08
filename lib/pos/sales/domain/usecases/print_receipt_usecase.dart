import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/utils/print_util.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/local_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/sync_queue_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/local_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class PrintReceiptUseCase {
  final AppSessionService _appSessionService;
  final ConnectivityService _connection;
  final RemoteReceiptConfigRepository _remoteReceiptConfigRepository;
  final LocalReceiptConfigRepository _localReceiptConfigRepository;

  const PrintReceiptUseCase({
    required AppSessionService appSessionService,
    required ConnectivityService connection,
    required RemoteReceiptConfigRepository remoteReceiptConfigRepository,
    required LocalReceiptConfigRepository localReceiptConfigRepository,
  })  : _appSessionService = appSessionService,
        _connection = connection,
        _remoteReceiptConfigRepository = remoteReceiptConfigRepository,
        _localReceiptConfigRepository = localReceiptConfigRepository;

  Future<Either<Failure, void>> call(Transaction transaction) async {
    /// Get app session from AppSessionService
    final receiptConfig = _appSessionService.receiptConfig;
    final branchId = _appSessionService.branchId;

    try {
      // If no receipt config found, check if there's internet connection and fetch the receipt config
      if (receiptConfig == null) {
        final isOnline = await _connection.isOnline;

        if (isOnline && branchId != null) {
          final result = await _remoteReceiptConfigRepository.getReceiptConfigByBranch(branchId);

          return result.fold(
            (failure) => Left(failure),
            (config) async {
              await PrintUtil.generateAndPrintReceipt(
                transaction: transaction,
                config: config,
              );

              _localReceiptConfigRepository.upsertReceiptConfig(config);
              _appSessionService.setReceiptConfig(config);

              return const Right(null);
            },
          );
        } else {
          return Left(UnexpectedFailure('Receipt configuration not found.'));
        }
      }

      // Otherwise, print the receipt right away with the config applied
      await PrintUtil.generateAndPrintReceipt(
        transaction: transaction,
        config: receiptConfig,
      );
      return const Right(null);
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error occurred. Failed to get receipt config details.'));
    }
  }
}
