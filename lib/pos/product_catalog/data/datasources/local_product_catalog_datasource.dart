import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';

class LocalProductCatalogDataSource {
  final PosCatalogDao _dao;

  LocalProductCatalogDataSource({required PosCatalogDao dao}) : _dao = dao;

  Future<void> upsertProductCatalog(List<CatalogItem> items) async {
    return await _dao.upsertProductCatalog(
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
