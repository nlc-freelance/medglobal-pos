import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/data/dto/sales_per_category_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_category/domain/repositories/sales_per_category_repository.dart';

abstract class SalesPerCategoryApi {
  Future<List<SalesPerCategoryDto>> getSalesPerCategory(SalesPerCategoryPayload payload);
}

class SalesPerCategoryApiImpl implements SalesPerCategoryApi {
  final ApiService _apiService;

  const SalesPerCategoryApiImpl(this._apiService);

  @override
  Future<List<SalesPerCategoryDto>> getSalesPerCategory(SalesPerCategoryPayload payload) async {
    try {
      final response = await _apiService.postData<SalesPerCategoryDto>(
        '/reports/sales-per-category',
        data: payload.toJson(),
        converter: SalesPerCategoryDto.fromJson,
      );
      return response.items!;
    } catch (_) {
      rethrow;
    }
  }
}
