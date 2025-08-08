import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';

abstract class RemoteProductCatalogRepository {
  Future<Either<Failure, PaginatedList<CatalogItem>>> getProducts(PageQuery query, {bool isDeltaSync = false});
}
