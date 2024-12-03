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
          if ([
            ReportType.PURCHASE_ORDER_CSV,
            ReportType.STOCK_RETURN_CSV,
            ReportType.STOCK_TAKE_CSV,
            ReportType.STOCK_TRANSFER_CSV,
          ].contains(type))
            ...?filters,
          if (type == ReportType.SALES_CSV) ...{
            ...?filters,
            'userId': userId,
          },
          if (type == ReportType.PRODUCT_HISTORY_CSV) ...?filters,
          if (type == ReportType.SALES_PER_CATEGORY) ...?filters,
          if (type == ReportType.SHIFT_REPORT_CSV) ...?filters,
          if (type == ReportType.SUPPLY_NEEDS_CSV) ...?filters,
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
