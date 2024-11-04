import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/report_dto.dart';

abstract class ReportsApi {
  Future<ReportDto> getReportById(int id);
  Future<ReportDto> createReport(ReportType type, Map<String, dynamic>? filters);
}

class ReportsApiImpl implements ReportsApi {
  final ApiService _apiService;

  const ReportsApiImpl(this._apiService);

  @override
  Future<ReportDto> createReport(ReportType type, Map<String, dynamic>? filters) async {
    int? userId = await SharedPreferencesService.getUserId();

    try {
      return await _apiService.post<ReportDto>(
        '/reports',
        data: {
          'type': type.value,
          if (type == ReportType.SALES_CSV) ...{
            'isAllBranches': true,
            'userId': userId,
          },
          if (type == ReportType.PRODUCT_HISTORY_CSV) ...?filters,
        },
        converter: ReportDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<ReportDto> getReportById(int id) async {
    try {
      return await _apiService.get<ReportDto>(
        '/reports/$id',
        converter: ReportDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
