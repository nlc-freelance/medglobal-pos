// import 'dart:convert';
//
// import 'package:medglobal_admin_portal/core/errors/errors.dart';
// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import 'package:medglobal_admin_portal/core/models/models.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_dto.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/local/local_product_catalog_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/remote/remote_pos_catalog_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_catalog/domain/entities/catalog_item.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/datasources/remote/sale_remote_datasource.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
// import 'package:medglobal_admin_portal/pos/sync/sync_queue_item.dart';
//
// class SyncService {
//   final AppDatabase _db;
//   final LocalProductCatalogDataSource _catalogLocal;
//   final RemoteProductCatalogDataSource _catalogRemote;
//   final SaleRemoteDatasource _salesRemote;
//
//   SyncService({
//     required AppDatabase db,
//     required LocalProductCatalogDataSource catalogLocal,
//     required RemoteProductCatalogDataSource catalogRemote,
//     required SaleRemoteDatasource salesApi,
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
