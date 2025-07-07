import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/create_report_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/response/report_dto.dart';

class ReportApiService {
  final BaseApiService _api;

  ReportApiService({required BaseApiService api}) : _api = api;

  /// Sends a POST request to the `/reports` endpoint to create a new report
  /// with the provided [payload] as the request body.
  ///
  /// The base service handles all network execution, response parsing, and error handling.
  Future<ReportDto> createReport(CreateReportDto payload) async {
    // int? userId = await SharedPreferencesService.getUserId();

    final response = await _api.post<ReportDto>(
      ApiEndpoints.reports,
      data: payload.toJson(),
      fromJson: ReportDto.fromJson,
    );

    return response.data;
  }

  /// Sends a GET request to `/reports` to fetch a list of reports.
  ///
  /// Supports optional query parameters such as filters, pagination, or search.
  /// The base service handles all network execution, response parsing, and error handling.
  Future<PaginatedList<ReportDto>> getReports(PageQuery query) async {
    final response = await _api.getPaginated<ReportDto>(
      ApiEndpoints.reports,
      queryParams: query.toJson(),
      fromJson: ReportDto.fromJson,
    );

    return PaginatedList<ReportDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  /// Sends a GET request to `/reports/{id}` to get a specific report by its [id].
  ///
  /// The base service handles all network execution, response parsing, and error handling.
  Future<ReportDto> getReport(int id) async {
    final response = await _api.get<ReportDto>(
      ApiEndpoints.reportById(id),
      fromJson: ReportDto.fromJson,
    );
    return response.data;
  }
}
