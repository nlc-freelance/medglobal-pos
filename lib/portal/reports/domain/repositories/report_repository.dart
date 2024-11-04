import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';

abstract class ReportRepository {
  Future<Either<Failure, Report>> getReportById(int id);
  Future<Either<Failure, Report>> createReport({required ReportType type, Map<String, dynamic>? filters});
}
