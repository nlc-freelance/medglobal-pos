import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, PaginatedList<Product>>> getProducts({int? page, int? size, String? search});
  Future<Either<Failure, Product>> getProductById(int id);
  Future<Either<Failure, Product>> create(Product product);
  Future<Either<Failure, Product>> update(int id, Product product);
  Future<Either<Failure, void>> delete(int id);
  Future<Either<Failure, void>> bulkUpdate(List<int> ids, Category? category);
  Future<Either<Failure, void>> bulkDelete(List<int> ids);
}
