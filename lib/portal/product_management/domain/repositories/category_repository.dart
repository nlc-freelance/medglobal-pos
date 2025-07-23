import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';

abstract class CategoryRepository {
  /// Retrieves a list of all categories
  Future<Either<Failure, PaginatedList<Category>>> getCategories(PageQuery query);

  /// Creates a new category
  Future<Either<Failure, Category>> createCategory(CategoryPayload payload);
}
