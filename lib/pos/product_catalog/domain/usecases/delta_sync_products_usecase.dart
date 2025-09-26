import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/sync_metadata/sync_metadata_dao.dart';
import 'package:medglobal_admin_portal/core/models/page_query.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';

class DeltaSyncProductsUseCase {
  final RemoteProductCatalogRepository _remote;
  final LocalProductCatalogRepository _local;
  final AppSessionService _session;
  final SyncMetadataDao _syncMetaDataDao;

  DeltaSyncProductsUseCase({
    required RemoteProductCatalogRepository remote,
    required LocalProductCatalogRepository local,
    required AppSessionService session,
    required SyncMetadataDao syncMetaDataDao,
  })  : _remote = remote,
        _local = local,
        _session = session,
        _syncMetaDataDao = syncMetaDataDao;

  Future<Either<Failure, void>> call(DateTime lastSyncedAt) async {
    // // Get last synced timestamp
    // final lastSynced = await _syncMetaDataDao.getLastSyncTime('posCatalog');
    // if (lastSynced == null) {
    //   throw ('No last sync timestamp found, initial fetch should be run first.');
    // }

    // Get branchId from AppSessionService
    final branchId = _session.branchId;

    try {
      if (branchId == null) {
        return Left(UserNotFoundFailure('Current branch details not found.'));
      }
    } catch (e) {
      return Left(UnexpectedFailure('Unexpected error occurred. Failed to get current branch details.'));
    }

    int currentPage = 1;
    bool hasMore = true;

    while (hasMore) {
      final query = PageQuery(
        page: currentPage,
        size: 50,
        extra: {
          'lastSynced': lastSyncedAt.millisecondsSinceEpoch,
          'branch': branchId,
        },
      );

      final response = await _remote.getProducts(query, isDeltaSync: true);

      final failure = await response.fold<Future<Failure?>>(
        // If API call fails, immediately return the failure wrapped in Future
        (failure) async => failure,

        // On success, upsert or delete current page items and update pagination flags
        (data) async {
          final result = await _local.deltaSyncProducts(data.items);

          final localFailure = await result.fold<Future<Failure?>>(
            (failure) async => failure,
            (_) async {
              await _syncMetaDataDao.updateLastSyncedAt('posCatalog');
              hasMore = data.hasMore;
              currentPage++;
              return null;
            },
          );

          return localFailure;
        },
      );

      // If a failure occurred during this page fetch, return early with the failure.
      // Otherwise, continue fetching the next page
      if (failure != null) return Left(failure);
    }

    return const Right(null);
  }
}
