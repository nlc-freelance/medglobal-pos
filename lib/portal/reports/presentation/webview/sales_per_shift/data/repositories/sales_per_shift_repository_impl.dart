import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/api/sales_per_shift_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/repositories/sales_per_shift_repository.dart';

class SalesPerShiftRepositoryImpl implements SalesPerShiftRepository {
  final SalesPerShiftApi _purchaseOrderApi;

  SalesPerShiftRepositoryImpl(this._purchaseOrderApi);

  @override
  Future<Either<Failure, SalesPerShiftDetails>> getSalesPerShiftById(int id) async {
    try {
      final response = await _purchaseOrderApi.getSalesPerShiftById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, SalesPerShiftPaginatedList>> getSalesPerShift({
    required int page,
    required int size,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _purchaseOrderApi.getSalesPerShift(
        page: page,
        size: size,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
