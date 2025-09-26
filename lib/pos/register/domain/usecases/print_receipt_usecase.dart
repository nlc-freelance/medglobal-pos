import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/utils/print_util.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class PrintReceiptUseCase {
  final AppSessionService _appSessionService;
  final ConnectivityService _connection;
  final RemoteReceiptConfigRepository _remoteReceiptConfigRepository;

  const PrintReceiptUseCase({
    required AppSessionService appSessionService,
    required ConnectivityService connection,
    required RemoteReceiptConfigRepository remoteReceiptConfigRepository,
  })  : _appSessionService = appSessionService,
        _connection = connection,
        _remoteReceiptConfigRepository = remoteReceiptConfigRepository;

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

              // update settings table
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
      return Left(UnexpectedFailure('Unexpected error occurred. ${e.toString()}'));
    }
  }
}
