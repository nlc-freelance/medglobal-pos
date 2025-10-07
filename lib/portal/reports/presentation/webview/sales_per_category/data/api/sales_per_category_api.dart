import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/base_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/data/dto/sales_per_category_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';

class SalesPerCategoryApi {
  final ApiService _api;

  SalesPerCategoryApi({required ApiService api}) : _api = api;

  Future<List<SalesPerCategoryDto>> getSalesPerCategory(SalesPerCategoryPayload payload) async {
    final data = await _api.postData<SalesPerCategoryDto>(
      '/reports/sales-per-category',
      data: payload.toJson(),
      parser: (json) => parse(json, SalesPerCategoryDto.fromJson),
    );

    return data;
  }
}
