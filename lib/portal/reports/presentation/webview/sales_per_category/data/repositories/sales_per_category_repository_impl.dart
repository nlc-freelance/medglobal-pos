import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/data/api/sales_per_category_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';

class SalesPerCategoryRepositoryImpl implements SalesPerCategoryRepository {
  final SalesPerCategoryApi _salesPerCategoryApi;

  SalesPerCategoryRepositoryImpl(this._salesPerCategoryApi);

  @override
  Future<Either<Failure, List<SalesPerCategory>>> getSalesPerCategory(SalesPerCategoryPayload payload) async {
    try {
      final response = await _salesPerCategoryApi.getSalesPerCategory(payload);
      return Right(response.map((value) => value.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
