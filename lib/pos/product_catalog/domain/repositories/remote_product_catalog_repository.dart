import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';

abstract class RemoteProductCatalogRepository {
  Future<ApiResult<PaginatedList<CatalogItem>>> getProducts(PageQuery query, {bool isDeltaSync = false});
}
