import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/data/api/reports_api.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ReportsApi _reportsApi;

  ReportRepositoryImpl(this._reportsApi);

  @override
  Future<Either<Failure, Report>> createReport({required ReportType type, Map<String, dynamic>? filters}) async {
    try {
      final response = await _reportsApi.createReport(type, filters);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, Report>> getReportById(int id) async {
    try {
      final response = await _reportsApi.getReportById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
