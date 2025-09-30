import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/receipt_config/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/delta_sync_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/initial_fetch_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync_queue/sync_queue_repository.dart';

class SyncService {
  final AppSessionService _session;
  final SyncQueueRepository _syncQueueRepository;
  final RemoteReceiptConfigRepository _receiptConfigRemoteRepo;
  final RemoteRegisterShiftRepository _registerShiftRemoteRepo;
  final RemoteSaleRepository _saleRemoteRepo;

  SyncService({
    required AppSessionService session,
    required SyncQueueRepository syncQueueRepository,
    required RemoteReceiptConfigRepository receiptConfigRemoteRepo,
    required RemoteRegisterShiftRepository registerShiftRemoteRepo,
    required RemoteSaleRepository saleRemoteRepo,
  })  : _session = session,
        _syncQueueRepository = syncQueueRepository,
        _receiptConfigRemoteRepo = receiptConfigRemoteRepo,
        _registerShiftRemoteRepo = registerShiftRemoteRepo,
        _saleRemoteRepo = saleRemoteRepo;

  Future<void> syncQueuedWrites() async {
    try {
      final queue = await _syncQueueRepository.getPendingItemsByUser();

      for (final item in queue) {
        await _syncToServer(item.table, jsonDecode(item.data));
        await _syncQueueRepository.removeItem(item.id);
      }
    } catch (e) {
      throw SyncException('Syncing to server failed: ${e.toString()}');
    }
  }

  Future<void> _syncToServer(String tableName, Map<String, dynamic> payload) async {
    switch (tableName) {
      case 'transactions':
        final result = await _saleRemoteRepo.createSale(payload);
        result.fold(
          (failure) => throw (SyncException(failure.message)),
          (_) => null,
        );
        break;
      case 'registerShifts':
        final result = await _registerShiftRemoteRepo.sendShift(payload);
        result.fold(
          (failure) => throw (SyncException(failure.message)),
          (_) => null,
        );
        break;
    }
  }

  Future<void> syncReadOnlyData() async {
    try {
      final readData = ['products'];
      // final readData = ['products', 'receiptConfig'];

      final catalogLastSyncedAt = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('posCatalog');

      for (final item in readData) {
        switch (item) {
          case 'products':
            final result = catalogLastSyncedAt == null
                ? await GetIt.I<InitialFetchProductsUseCase>().call()
                : await GetIt.I<DeltaSyncProductsUseCase>().call(catalogLastSyncedAt);

            result.fold(
              (failure) => throw SyncException(failure.message),
              (_) {},
            );
            break;
          case 'receiptConfig':
            final lastSyncedTime = await GetIt.I<AppDatabase>().syncMetadataDao.getLastSyncTime('receiptConfig');
            final branchId = _session.branchId;

            if (branchId == null) {
              throw SyncException('Unexpected error occurred. Failed to sync receipt configuration');
            }

            final result = await _receiptConfigRemoteRepo.getReceiptConfigByBranch(
              branchId,
              lastSynced: lastSyncedTime?.millisecondsSinceEpoch,
            );

            result.fold(
              (failure) => throw SyncException(failure.message),
              (_) {},
            );
        }
      }
    } catch (e) {
      throw SyncException('Syncing to local failed. ${e.toString()}');
    }
  }
}
