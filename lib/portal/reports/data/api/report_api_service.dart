import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/report_payload.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/response/report_dto.dart';

class ReportApiService {
  final ApiService _api;

  ReportApiService({required ApiService api}) : _api = api;

  /// Sends a POST request to the `/reports` endpoint to create a new report
  /// with the provided [payload] as the request body.
  ///
  /// The base service handles all network execution, response parsing, and error handling.
  Future<ReportDto> createReport(ReportPayload payload) async {
    // int? userId = await SharedPreferencesService.getUserId();

    final data = await _api.post<ReportDto>(
      ApiEndpoints.reports,
      data: payload.toJson(),
      parser: (json) => parse(json, ReportDto.fromJson),
    );

    return data;
  }

  /// Sends a GET request to `/reports` to fetch a list of reports.
  ///
  /// Supports optional query parameters such as filters, pagination, or search.
  /// The base service handles all network execution, response parsing, and error handling.
  Future<PaginatedList<ReportDto>> getReports(PageQuery query) async {
    final data = await _api.getPaginated<ReportDto>(
      ApiEndpoints.reports,
      queryParams: query.toJson(),
      parser: (json) => parse(json, ReportDto.fromJson),
    );

    return PaginatedList<ReportDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  /// Sends a GET request to `/reports/{id}` to get a specific report by its [id].
  ///
  /// The base service handles all network execution, response parsing, and error handling.
  Future<ReportDto> getReport(int id) async {
    final data = await _api.get<ReportDto>(
      ApiEndpoints.reportById(id),
      parser: (json) => parse(json, ReportDto.fromJson),
    );
    return data;
  }
}
