import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/pos_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/core/local_db/native/catalog/pos_catalog_dao.dart';

class PosCatalogLocalDataSource {
  final PosCatalogDao _dao;

  PosCatalogLocalDataSource({required PosCatalogDao dao}) : _dao = dao;

  Future<void> upsertProductCatalog(List<CatalogItem> items) async {
    return await _dao.upsertProductCatalog(
      items.map((item) => item.toDriftCompanion()).toList(),
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
