import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category_list.dart';

abstract class CategoryRepository {
  Future<Either<Failure, Category>> addCategory(String name);
  Future<Either<Failure, CategoryList>> getCategories(int page);
}
