import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_delete_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_update_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

abstract class ProductRepository {
  /// Retrieves a list of all products
  Future<ApiResult<PaginatedList<Product>>> getProducts(PageQuery query);

  /// Retrieves a product by [id]
  Future<ApiResult<Product>> getProductById(int id);

  /// Creates a new product
  Future<ApiResult<Product>> createProduct(ProductPayload payload);

  /// Updates an existing product
  Future<ApiResult<Product>> updateProduct(int id, ProductPayload payload);

  /// Deletes a product by [id]
  Future<ApiResult<void>> deleteProduct(int id);

  /// Bulk update product's category
  Future<ApiResult<void>> bulkUpdateProducts(ProductBulkUpdatePayload payload);

  /// Bulk delete products
  Future<ApiResult<void>> bulkDeleteProducts(ProductBulkDeletePayload payload);
}
