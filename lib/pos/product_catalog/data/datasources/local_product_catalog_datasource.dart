import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';

class LocalProductCatalogDataSource {
  final ProductCatalogDao _dao;

  LocalProductCatalogDataSource({required ProductCatalogDao dao}) : _dao = dao;

  Future<void> upsertProducts(List<CatalogItem> items) async {
    return await _dao.upsertProducts(
      items.map((item) => item.toProductCatalogCompanion).toList(),
    );
  }

  Future<void> updateStock(int productId, int quantityToDeduct) async {
    return await _dao.updateStock(productId, quantityToDeduct);
  }

  Future<void> deleteProducts(List<CatalogItem> items) async {
    return await _dao.deleteProducts(
      items.map((item) => item.toProductCatalogCompanion).toList(),
    );
  }

  Future<PaginatedList<CatalogItemModel>> getProductCatalog(int page, int size, String? search) async {
    return await _dao.getProductCatalog(
      page: page,
      size: size,
      search: search,
    );
  }
}
