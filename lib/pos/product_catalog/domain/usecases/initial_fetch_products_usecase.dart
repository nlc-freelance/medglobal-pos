import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/sync_metadata/sync_metadata_dao.dart';
import 'package:medglobal_admin_portal/core/models/query_params.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';

class InitialFetchProductsUseCase {
  final RemoteProductCatalogRepository _remote;
  final LocalProductCatalogRepository _local;
  final AppSessionService _session;
  final SyncMetadataDao _syncMetaDataDao;

  InitialFetchProductsUseCase({
    required RemoteProductCatalogRepository remote,
    required LocalProductCatalogRepository local,
    required AppSessionService session,
    required SyncMetadataDao syncMetaDataDao,
  })  : _remote = remote,
        _local = local,
        _session = session,
        _syncMetaDataDao = syncMetaDataDao;

  /// Fetches all catalog items from the remote source (with pagination)
  /// and stores them in the local database.
  ///
  /// - Fetches pages of products from the remote API using a page/size query.
  /// - Continues paging while [hasMore] is true.
  /// - On each successful response, appends items to [allProducts].
  /// - If any request fails, returns a [Left] with the corresponding [Failure].
  /// - After fetching all pages, upserts the complete list into local storage.
  ///
  /// Returns:
  /// - [Right<void>] on success (all products saved locally).
  /// - [Left<Failure>] if any remote fetch fails.
  Future<ApiResult<void>> call() async {
    /// Get branchId from AppSessionService
    final branchId = _session.branchId;

    try {
      if (branchId == null) {
        return ApiResult.failure(UserNotFoundFailure('Current branch details not found.'));
      }
    } catch (e) {
      return ApiResult.failure(UnexpectedFailure('Unexpected error occurred. Failed to get current branch details.'));
    }

    int currentPage = 1;
    bool hasMore = true;

    while (hasMore) {
      final query = PageQuery(
        page: currentPage,
        size: 50,
        extra: {'branch': branchId},
      );

      final productResult = await _remote.getProducts(query);

      productResult.when(
        success: (data) async {
          final failure = await _handleInitialSync(data.items);

          if (failure != null) return ApiResult.failure(failure);

          try {
            await _syncMetaDataDao.updateLastSyncedAt('posCatalog');
          } catch (e) {
            return ApiResult.failure(LocalDatabaseFailure('Write to local database failed.'));
          }

          hasMore = data.hasMore;
          currentPage++;
        },
        failure: (failure) async => failure, // If API call fails,  return the failure
      );
    }

    return const ApiResult.success(null);
  }

  Future<Failure?> _handleInitialSync(List<CatalogItem> products) async {
    final result = await _local.upsertProducts(products);

    return result.when(
      success: (_) => null,
      failure: (failure) => failure,
    );
  }
}
