import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category_paginated_list.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryPaginatedList>> getCategories({required int page});
  Future<Either<Failure, Category>> addCategory(String name);
}
