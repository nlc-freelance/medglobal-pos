import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/device_register/pos_session_service.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';

// class GetProductCatalogUseCase implements UseCase<PaginatedList<CatalogItem>, GetProductCatalogParams> {
//   final RemoteProductCatalogRepository _remote;
//
//   GetProductCatalogUseCase({required RemoteProductCatalogRepository remote}) : _remote = remote;
//
//   @override
//   Future<Either<Failure, PaginatedList<CatalogItem>>> call(GetProductCatalogParams params) => _remote.getCatalogItems(
//         PageQuery(
//           page: params.page,
//           search: params.search,
//         ),
//       );
// }
//
// class GetProductCatalogParams {
//   final int page;
//   final String? search;
//   final String? category;
//
//   GetProductCatalogParams({required this.page, this.search, this.category});
// }

class InitialFetchProductsUseCase {
  final RemoteProductCatalogRepository _remote;
  final LocalProductCatalogRepository _local;
  final UserSessionService _session;
  final SyncMetadataDao _syncMetaDataDao;

  InitialFetchProductsUseCase({
    required RemoteProductCatalogRepository remote,
    required LocalProductCatalogRepository local,
    required UserSessionService session,
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
  Future<Either<Failure, void>> call() async {
    final branchId = _session.branchId;

    /// Get branchId from UserSessionService
    try {
      if (branchId == null) {
        throw Left(UserNotFoundFailure('Current branch details not found.'));
      }
    } catch (e) {
      throw Left(UnexpectedFailure('Unexpected error occurred. Failed to get current branch details.'));
    }

    int currentPage = 1;
    bool hasMore = true;

    while (hasMore) {
      final query = PageQuery(
        page: currentPage,
        size: 50,
        extra: {'branch': branchId},
      );

      final response = await _remote.getCatalogItems(query);

      final failure = await response.fold<Future<Failure?>>(
        // If API call fails, immediately return the failure wrapped in Future
        (failure) async => failure,

        // On success, upsert current page items and update pagination flags
        (data) async {
          final result = await _local.upsertProducts(data.items);

          final localFailure = result.fold<Future<Failure?>>(
            (failure) async => failure,
            (_) async {
              await _syncMetaDataDao.insertLastSyncAt('posCatalog', DateTime.now());
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

// class DeltaSyncProductsUseCase {
//   final RemoteProductCatalogRepository _remote;
//   final LocalProductCatalogRepository _local;
//   final SyncMetadataDao _syncMetaDataDao;
//
//   DeltaSyncProductsUseCase({
//     required RemoteProductCatalogRepository remote,
//     required LocalProductCatalogRepository local,
//     required SyncMetadataDao syncMetaDataDao,
//   })  : _remote = remote,
//         _local = local,
//         _syncMetaDataDao = syncMetaDataDao;
//
//   Future<Either<Failure, PaginatedList<CatalogItem>>> call(PageQuery query) async {}
// }

class GetProductCatalogUseCase {
  final LocalProductCatalogRepository _local;

  GetProductCatalogUseCase({
    required LocalProductCatalogRepository local,
  }) : _local = local;

  Future<Either<Failure, PaginatedList<CatalogItem>>> call(PageQuery query) async {
    return await _local.getProductCatalog(query);
  }
}
