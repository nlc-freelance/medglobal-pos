import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();

  Future<Either<Failure, Category>> addCategory(String name);
}
