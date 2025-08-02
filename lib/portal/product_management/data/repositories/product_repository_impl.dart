import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_delete_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_update_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/product_mapper.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

/// Concrete implementation of [ProductRepository] that uses [ProductApi] for API calls
/// and [BaseRepository] to centralize error handling.
class ProductRepositoryImpl extends BaseRepository implements ProductRepository {
  final ProductApi _api;

  ProductRepositoryImpl({required ProductApi api}) : _api = api;

  @override
  Future<Either<Failure, PaginatedList<Product>>> getProducts(PageQuery query) {
    return call(() async {
      final response = await _api.getProducts(query);
      return ProductMapper.fromDtoList(response);
    });
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) {
    return call(() async {
      final response = await _api.getProductById(id);
      return ProductMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, Product>> createProduct(ProductPayload payload) {
    return call(() async {
      final response = await _api.createProduct(payload);
      return ProductMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, Product>> updateProduct(int id, ProductPayload payload) {
    return call(() async {
      final response = await _api.updateProduct(id, payload);
      return ProductMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) {
    return call(() async => await _api.deleteProduct(id));
  }

  @override
  Future<Either<Failure, void>> bulkDeleteProducts(ProductBulkDeletePayload payload) {
    return call(() async => await _api.bulkDeleteProducts(payload));
  }

  @override
  Future<Either<Failure, void>> bulkUpdateProducts(ProductBulkUpdatePayload payload) {
    return call(() async => await _api.bulkUpdateProducts(payload));
  }
}
