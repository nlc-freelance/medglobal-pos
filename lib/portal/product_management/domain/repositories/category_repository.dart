import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';

abstract class CategoryRepository {
  /// Retrieves a list of all categories
  Future<ApiResult<PaginatedList<Category>>> getCategories(PageQuery query);

  /// Creates a new category
  Future<ApiResult<Category>> createCategory(CategoryPayload payload);
}
