import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product_paginated_list.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductPaginatedList>> getProducts(int page);
  Future<Either<Failure, Product>> getProductById(int id);
  Future<Either<Failure, void>> create(Product product);
  Future<Either<Failure, void>> update(int id, Product product);
  Future<Either<Failure, void>> delete(int id);
  Future<Either<Failure, void>> bulkUpdate(List<int> ids, Category? category);
  Future<Either<Failure, void>> bulkDelete(List<int> ids);
}
