import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/local_product_catalog_repository.dart';

class GetProductCatalogUseCase {
  final LocalProductCatalogRepository _local;

  GetProductCatalogUseCase({
    required LocalProductCatalogRepository local,
  }) : _local = local;

  Future<ApiResult<PaginatedList<CatalogItem>>> call(PageQuery query) async {
    return await _local.getProductCatalog(query);
  }
}
