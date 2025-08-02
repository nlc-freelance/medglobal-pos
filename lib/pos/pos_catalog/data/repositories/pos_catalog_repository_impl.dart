import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/native/catalog/pos_catalog_dao.dart';
import 'package:medglobal_admin_portal/core/models/page_query.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/local/pos_catalog_local_datasource.dart';
import 'package:medglobal_admin_portal/pos/pos_catalog/data/datasources/remote/pos_catalog_remote_datasource.dart';
import 'package:medglobal_admin_portal/pos/pos_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/pos_catalog/domain/repositories/pos_catalog_repository.dart';

class SaleRepositoryImpl extends BaseRepository implements PosCatalogRepository {
  final PosCatalogLocalDataSource _local;
  final PosCatalogRemoteDatasource _remote;

  SaleRepositoryImpl({
    required PosCatalogLocalDataSource local,
    required PosCatalogRemoteDatasource remote,
  })  : _local = local,
        _remote = remote;

  @override
  Future<Either<Failure, PaginatedList<CatalogItem>>> getProductCatalog(PageQuery query) {
    return call(() async {
      final data = await _local.getProductCatalog(query.page, query.size, query.search);
      return PaginatedList<CatalogItem>(
        items: data.items.map((item) => item.toDomain()).toList(),
        currentSize: data.currentSize,
        currentPage: data.currentPage,
        totalPages: data.totalPages,
        totalCount: data.totalCount,
      );
    });
  }
}
