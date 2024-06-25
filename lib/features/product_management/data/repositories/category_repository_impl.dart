import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/features/product_management/data/api/category_api.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApi _categoryApi;

  CategoryRepositoryImpl(this._categoryApi);

  @override
  Future<Either<Failure, void>> add(Category category) async {
    try {
      return Right(await _categoryApi.add(category));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
