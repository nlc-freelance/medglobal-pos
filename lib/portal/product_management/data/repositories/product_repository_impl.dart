import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/api/product_api.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi _productApi;

  ProductRepositoryImpl(this._productApi);

  @override
  Future<Either<Failure, PaginatedList<Product>>> getProducts({
    int? page,
    int? size,
    String? search,
  }) async {
    try {
      final responseDto = await _productApi.getProducts(
        page: page,
        size: size,
        search: search,
      );
      return Right(responseDto.convert((item) => item.toDomain()));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> bulkDelete(List<int> ids) async {
    try {
      return Right(await _productApi.bulkDelete(ids));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> bulkUpdate(List<int> ids, Category? category) async {
    try {
      return Right(await _productApi.bulkUpdate(ids, category));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    try {
      final response = await _productApi.getProductById(id);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Product>> create(Product product) async {
    try {
      final responseDto = await _productApi.createProduct(product);
      return Right(responseDto.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Product>> update(int id, Product product) async {
    try {
      final responseDto = await _productApi.updateProduct(product);
      return Right(responseDto.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return Right(await _productApi.deleteProduct(id));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
