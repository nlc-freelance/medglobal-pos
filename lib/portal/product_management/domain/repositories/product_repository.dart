import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_delete_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_update_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

abstract class ProductRepository {
  /// Retrieves a list of all products
  Future<Either<Failure, PaginatedList<Product>>> getProducts(PageQuery query);

  /// Retrieves a product by [id]
  Future<Either<Failure, Product>> getProductById(int id);

  /// Creates a new product
  Future<Either<Failure, Product>> createProduct(ProductPayload payload);

  /// Updates an existing product
  Future<Either<Failure, Product>> updateProduct(int id, ProductPayload payload);

  /// Deletes a product by [id]
  Future<Either<Failure, void>> deleteProduct(int id);

  /// Bulk update product's category
  Future<Either<Failure, void>> bulkUpdateProducts(ProductBulkUpdatePayload payload);

  /// Bulk delete products
  Future<Either<Failure, void>> bulkDeleteProducts(ProductBulkDeletePayload payload);
}
