import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';

abstract class LocalProductCatalogRepository {
  Future<Either<Failure, PaginatedList<CatalogItem>>> getProductCatalog(PageQuery query);
  Future<Either<Failure, void>> upsertProducts(List<CatalogItem> products);
}
