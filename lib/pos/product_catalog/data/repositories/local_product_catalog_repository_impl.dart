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
  Future<Either<Failure, void>> upsertProducts(List<CatalogItem> products) {
    return call(() async {
      if (products.isEmpty) return;

      return await _localDataSource.upsertProducts(products);
    });
  }

  @override
  Future<Either<Failure, void>> deleteProducts(List<CatalogItem> products) {
    return call(() async {
      if (products.isEmpty) return;

      return await _localDataSource.deleteProducts(products);
    });
  }

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
  Future<Either<Failure, void>> deltaSyncProducts(List<CatalogItem> products) {
    return call(() async {
      final List<CatalogItem> itemsForDeletion = [];
      final List<CatalogItem> itemsForUpsert = [];

      for (final item in products) {
        item.action == 'DELETED' ? itemsForDeletion.add(item) : itemsForUpsert.add(item);
      }

      print(
          'ITEMS FOR DELETION ${itemsForDeletion.map((item) => '${item.displayName} ${item.action}').toList().toString()}');
      print(
          'ITEMS FOR UPSERT ${itemsForUpsert.map((item) => '${item.displayName} ${item.action}').toList().toString()}');

      await _localDataSource.deleteProducts(itemsForDeletion);

      await _localDataSource.upsertProducts(itemsForUpsert);
    });
  }
}
