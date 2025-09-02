import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/page_query.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/data/api/report_api_service.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/report_payload.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/response/report_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';
import 'package:universal_html/html.dart' as html;

/// Concrete implementation of [ReportRepository] that uses [ReportApiService].
///
/// This class wraps responses using [Either] to handle success and failure cases consistently.
///
/// Network and unexpected errors thrown by the API service are caught and
/// converted into domain-level [Failure] objects via [BaseRepository.call].
///
class ReportRepositoryImpl extends BaseRepository implements ReportRepository {
  final ReportApiService _api;

  ReportRepositoryImpl({required ReportApiService api}) : _api = api;

  @override
  Future<Either<Failure, Report>> createReport(ReportPayload payload) async {
    return call(() async {
      final responseDto = await _api.createReport(payload);
      return responseDto.toDomain();
    });
  }

  @override
  Future<Either<Failure, PaginatedList<Report>>> getReports(PageQuery query) async {
    return call(() async {
      final responseDto = await _api.getReports(query);
      return responseDto.convert((item) => item.toDomain());
    });
  }

  @override
  Future<Either<Failure, Report>> getReport(int id) async {
    return call(() async {
      final responseDto = await _api.getReport(id);
      return responseDto.toDomain();
    });
  }

  /// This is specific to Flutter Web, and uses an anchor tag
  /// to programmatically initiate the download. The downloaded file name
  /// is derived from the last segment of the URL path.
  @override
  Future<void> downloadReport(String fileUrl) async {
    final url = fileUrl;
    final fileName = Uri.parse(url).pathSegments.first;

    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..setAttribute('target', '_blank')
      ..click();

    anchor.remove();
  }
}
