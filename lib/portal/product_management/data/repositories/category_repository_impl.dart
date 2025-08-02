import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_mapper.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';

/// Concrete implementation of [CategoryRepository] that uses [CategoryApi] for API calls
/// and [BaseRepository] to centralize error handling.
class CategoryRepositoryImpl extends BaseRepository implements CategoryRepository {
  final CategoryApi _api;

  CategoryRepositoryImpl({required CategoryApi api}) : _api = api;

  @override
  Future<Either<Failure, Category>> createCategory(CategoryPayload payload) {
    return call(() async {
      final response = await _api.createCategory(payload);
      return CategoryMapper.fromDto(response);
    });
  }

  @override
  Future<Either<Failure, PaginatedList<Category>>> getCategories(PageQuery query) {
    return call(() async {
      final response = await _api.getCategories(query);
      final paginatedCategories = response.convert((dto) => CategoryMapper.fromDto(dto));

      return paginatedCategories;
    });
  }
}
