import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';

class CreateReportUseCase implements UseCase<Report, CreateReportParams> {
  final ReportRepository repository;

  const CreateReportUseCase(this.repository);

  @override
  Future<Either<Failure, Report>> call(CreateReportParams params) => repository.createReport(
        type: params.type,
        filters: params.filters,
      );
}

class CreateReportParams {
  final ReportType type;
  final Map<String, dynamic>? filters;

  CreateReportParams({required this.type, this.filters});
}
