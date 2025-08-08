import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_dto.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/local/local_product_catalog_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/remote/remote_product_catalog_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/local_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/remote_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/usecases/delta_sync_products_usecase.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/local_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/remote_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/local_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/repositories/remote_register_shift_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/local_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/repositories/remote_sale_repository.dart';
import 'package:medglobal_admin_portal/pos/sync/sync_queue_item.dart';

import '../product_catalog/domain/repositories/local_product_catalog_repository.dart'
    show LocalProductCatalogRepository;
import '../register_shift/domain/entities/register_shift.dart';

class SyncService {
  final AppDatabase _db;
  final ConnectivityService _connection;

  // Read remote, store/update in local
  // Product
  final LocalProductCatalogRepository _productCatalogLocalRepo;
  final RemoteProductCatalogRepository _productCatalogRemoteRepo;
  // Receipt config
  final LocalReceiptConfigRepository _receiptConfigLocalRepo;
  final RemoteReceiptConfigRepository _receiptConfigRemoteRepo;

  // Read local, send to remote
  // Shifts
  final LocalRegisterShiftRepository _registerShiftLocalRepo;
  final RemoteRegisterShiftRepository _registerShiftRemoteRepo;
  // Transactions
  final LocalSaleRepository _saleLocalRepo;
  final RemoteSaleRepository _saleRemoteRepo;

  SyncService({
    required AppDatabase db,
    required ConnectivityService connection,
    required LocalProductCatalogRepository productCatalogLocalRepo,
    required RemoteProductCatalogRepository productCatalogRemoteRepo,
    required LocalReceiptConfigRepository receiptConfigLocalRepo,
    required RemoteReceiptConfigRepository receiptConfigRemoteRepo,
    required LocalRegisterShiftRepository registerShiftLocalRepo,
    required RemoteRegisterShiftRepository registerShiftRemoteRepo,
    required LocalSaleRepository saleLocalRepo,
    required RemoteSaleRepository saleRemoteRepo,
  })  : _db = db,
        _connection = connection,
        _productCatalogLocalRepo = productCatalogLocalRepo,
        _productCatalogRemoteRepo = productCatalogRemoteRepo,
        _receiptConfigLocalRepo = receiptConfigLocalRepo,
        _receiptConfigRemoteRepo = receiptConfigRemoteRepo,
        _registerShiftLocalRepo = registerShiftLocalRepo,
        _registerShiftRemoteRepo = registerShiftRemoteRepo,
        _saleLocalRepo = saleLocalRepo,
        _saleRemoteRepo = saleRemoteRepo;

  // bool _isSyncing = false;
  //
  // bool get isSyncing => _isSyncing;
  //
  // Future<void> sync() async {
  //   if (_isSyncing) return;
  //   _isSyncing = true;
  //
  //   try {
  //     // await _syncQueuedWrites();
  //     // await _syncProductCatalog();
  //   } catch (e) {
  //     rethrow;
  //   } finally {
  //     _isSyncing = false;
  //   }
  // }

  Future<void> syncQueuedWrites() async {
    final queue = await _db.syncQueueDao.getPendingItems();

    for (final item in queue) {
      // final parsed = SyncQueueItem.fromJson({
      //   'tableName': item.table,
      //   'action': 'write',
      //   'payload': jsonDecode(item.data),
      //   'status': '',
      // });

      print('syncqueue item');
      print(item);

      try {
        await _syncToServer(item.table, jsonDecode(item.data));
        // also mark as sync in the actual table of the sync item
        // if this is a transaction, we also mark here the transaction as synced in transactions table
        // before deleting it in the queue
        await _db.syncQueueDao.deleteItem(item.id);
      } catch (e) {
        throw SyncException('Syncing to server failed: ${e.toString()}');
      }
    }
  }

  Future<void> _syncToServer(String tableName, Map<String, dynamic> payload) async {
    // final payload = jsonDecode(item.payload);

    print(payload);

    switch (tableName) {
      case 'transactions':
        // if (item.action == 'insert') {
        await _saleRemoteRepo.createSale(payload);
        // }
        break;

      case 'registerShifts':
        // if (item.action == 'insert') {
        // await _registerShiftRemoteRepo.sendShift(RegisterShift.fromJson(payload));
        await _registerShiftRemoteRepo.sendShift(payload);
        // }
        break;
    }
  }

  Future<void> syncReadOnlyData() async {
    try {
      final result = await GetIt.I<DeltaSyncProductsUseCase>().call();

      result.fold(
        (failure) => throw SyncException(failure.message),
        (_) {},
      );
    } catch (e) {
      throw SyncException('Syncing to local failed. ${e.toString()}');
    }
  }

  // Future<void> _syncProductCatalog() async {
  //   try {
  //     final lastSyncAt =
  //         await _db.syncMetadataDao.getLastSyncTime('posCatalog') ?? DateTime.fromMillisecondsSinceEpoch(0);
  //
  //     int currentPage = 1;
  //     bool hasMore = true;
  //
  //     while (hasMore) {
  //       final response = await _catalogRemote.getProductCatalog(
  //         PageQuery(
  //           page: currentPage,
  //           size: 100,
  //           extra: {'lastSyncAt': lastSyncAt},
  //         ),
  //       );
  //
  //       final remoteProducts = response.items
  //           .map((item) => CatalogItem(
  //                 id: item.id!,
  //                 displayName: item.displayName!,
  //                 stock: item.qtyOnHand!,
  //                 price: item.price!,
  //               ))
  //           .toList();
  //       hasMore = response.hasMore;
  //
  //       await _catalogLocal.upsertProductCatalog(remoteProducts);
  //
  //       currentPage++;
  //     }
  //
  //     // Only update sync time after all pages are fetched
  //     await _db.syncMetadataDao.updateLastSyncTime('posCatalog', DateTime.now());
  //   } catch (e) {
  //     throw SyncException('Syncing to app failed: ${e.toString()}');
  //   }
  // }
}

// import 'dart:convert';
//
// import 'package:medglobal_admin_portal/core/errors/errors.dart';
// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import 'package:medglobal_admin_portal/core/models/models.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_dto.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/local/local_product_catalog_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/remote/remote_product_catalog_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/domain/entities/catalog_item.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/datasources/remote/sale_remote_datasource.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
// import 'package:medglobal_admin_portal/pos/sync/sync_queue_item.dart';
//
// class SyncService {
//   final AppDatabase _db;
//   final LocalProductCatalogDataSource _catalogLocal;
//   final RemoteProductCatalogDataSource _catalogRemote;
//   final RemoteSaleDataSource _salesRemote;
//
//   SyncService({
//     required AppDatabase db,
//     required LocalProductCatalogDataSource catalogLocal,
//     required RemoteProductCatalogDataSource catalogRemote,
//     required RemoteSaleDataSource salesApi,
//   })  : _db = db,
//         _catalogLocal = catalogLocal,
//         _catalogRemote = catalogRemote,
//         _salesRemote = salesApi;
//
//   bool _isSyncing = false;
//
//   bool get isSyncing => _isSyncing;
//
//   Future<void> sync() async {
//     if (_isSyncing) return;
//     _isSyncing = true;
//
//     try {
//       // await _syncQueuedWrites();
//       // await _syncProductCatalog();
//     } catch (e) {
//       rethrow;
//     } finally {
//       _isSyncing = false;
//     }
//   }
//
//   Future<void> _syncQueuedWrites() async {
//     final queue = await _db.syncQueueDao.getPendingQueueItems();
//
//     for (final item in queue) {
//       final parsed = SyncQueueItem.fromJson({
//         'tableName': item.table,
//         'action': item.action,
//         'payload': jsonDecode(item.payload),
//       });
//
//       try {
//         await _syncToServer(parsed);
//         // also mark as sync in the actual table of the sync item
//         // if this is a transaction, we also mark here the transaction as synced in transactions table
//         // before deleting it in the queue
//         await _db.syncQueueDao.deleteQueueItem(item.id);
//       } catch (e) {
//         throw SyncException('Syncing to server failed: ${e.toString()}');
//       }
//     }
//   }
//
//   Future<void> _syncToServer(SyncQueueItem item) async {
//     final payload = jsonDecode(item.payload);
//
//     switch (item.tableName) {
//       case 'transactions':
//         if (item.action == 'insert') {
//           await _salesRemote.createSale(OrderPayload.fromJson(payload));
//         }
//         break;
//     }
//   }
//
//   Future<void> _syncProductCatalog() async {
//     try {
//       final lastSyncAt =
//           await _db.syncMetadataDao.getLastSyncTime('posCatalog') ?? DateTime.fromMillisecondsSinceEpoch(0);
//
//       int currentPage = 1;
//       bool hasMore = true;
//
//       while (hasMore) {
//         final response = await _catalogRemote.getProductCatalog(
//           PageQuery(
//             page: currentPage,
//             size: 100,
//             extra: {'lastSyncAt': lastSyncAt},
//           ),
//         );
//
//         final remoteProducts = response.items
//             .map((item) => CatalogItem(
//                   id: item.id!,
//                   displayName: item.displayName!,
//                   stock: item.qtyOnHand!,
//                   price: item.price!,
//                 ))
//             .toList();
//         hasMore = response.hasMore;
//
//         await _catalogLocal.upsertProductCatalog(remoteProducts);
//
//         currentPage++;
//       }
//
//       // Only update sync time after all pages are fetched
//       await _db.syncMetadataDao.updateLastSyncTime('posCatalog', DateTime.now());
//     } catch (e) {
//       throw SyncException('Syncing to app failed: ${e.toString()}');
//     }
//   }
// }
