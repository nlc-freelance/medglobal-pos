import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApi _categoryApi;

  CategoryRepositoryImpl(this._categoryApi);

  @override
  Future<Either<Failure, Category>> addCategory(String name) async {
    try {
      final response = await _categoryApi.addNewCategory(name);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, PaginatedList<Category>>> getCategories({required PageQuery filters}) async {
    try {
      final response = await _categoryApi.getCategories(filters: filters);
      return Right(response.convert((item) => item.toEntity()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
