import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/core/models/page_query.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/local_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';

class LocalProductCatalogRepositoryImpl extends BaseRepository implements LocalProductCatalogRepository {
  final LocalProductCatalogDataSource _localDataSource;

  LocalProductCatalogRepositoryImpl({
    required LocalProductCatalogDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  @override
  Future<Either<Failure, PaginatedList<CatalogItem>>> getProductCatalog(PageQuery query) {
    return call(() async {
      final data = await _localDataSource.getProductCatalog(query.page, query.size, query.search);

      return PaginatedList<CatalogItem>(
        items: data.items.map((item) => item.toDomain()).toList(),
        currentSize: data.currentSize,
        currentPage: data.currentPage,
        totalPages: data.totalPages,
        totalCount: data.totalCount,
      );
    });
  }

  @override
  Future<Either<Failure, void>> upsertProducts(List<CatalogItem> products) {
    return call(() async {
      return await _localDataSource.upsertProductCatalog(products);
    });
  }
}
