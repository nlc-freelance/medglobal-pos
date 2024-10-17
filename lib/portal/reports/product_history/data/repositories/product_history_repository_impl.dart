import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/data/api/product_history_api.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/domain/entities/product_history_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/domain/repositories/product_history_repository.dart';

class ProductHistoryRepositoryImpl implements ProductHistoryRepository {
  final ProductHistoryApi _purchaseOrderApi;

  ProductHistoryRepositoryImpl(this._purchaseOrderApi);

  @override
  Future<Either<Failure, ProductHistoryPaginatedList>> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    required int page,
    required int size,
  }) async {
    try {
      final response = await _purchaseOrderApi.getProductHistory(
        page: page,
        size: size,
        variantId: variantId,
        branchId: branchId,
        startDate: startDate,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
