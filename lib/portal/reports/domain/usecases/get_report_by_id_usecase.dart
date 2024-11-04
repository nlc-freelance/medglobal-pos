import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';

class GetReportByIdUseCase implements UseCase<Report, GetReportByIdParams> {
  final ReportRepository repository;

  const GetReportByIdUseCase(this.repository);

  @override
  Future<Either<Failure, Report>> call(GetReportByIdParams params) => repository.getReportById(params.id);
}

class GetReportByIdParams {
  final int id;

  GetReportByIdParams(this.id);
}
