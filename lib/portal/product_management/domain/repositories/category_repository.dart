import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, PaginatedList<Category>>> getCategories({required PageQuery filters});
  Future<Either<Failure, Category>> addCategory(String name);
}
