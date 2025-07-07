import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/create_report_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';

abstract class ReportRepository {
  /// Triggers creation of a new report.
  Future<Either<Failure, Report>> createReport(CreateReportDto payload);

  /// Retrieves a list of reports that match the optional [queryParams].
  Future<Either<Failure, PaginatedList<Report>>> getReports(PageQuery filters);

  /// Retrieves a specific report by its [id].
  Future<Either<Failure, Report>> getReport(int id);

  /// Triggers the browser-based download for a report using its [fileUrl].
  Future<void> downloadReport(String fileUrl);
}
