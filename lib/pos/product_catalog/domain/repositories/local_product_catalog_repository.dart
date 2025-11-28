import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_result.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';

abstract class LocalProductCatalogRepository {
  Future<ApiResult<void>> upsertProducts(List<CatalogItem> products);

  Future<ApiResult<void>> deltaSyncProducts(List<CatalogItem> products);

  Future<ApiResult<PaginatedList<CatalogItem>>> getProductCatalog(PageQuery query);

  Future<ApiResult<void>> updateStock(int productId, int newStock);
}
