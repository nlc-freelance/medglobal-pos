import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/data/api/sales_per_category_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';

/// Concrete implementation of [SalesPerCategoryRepository] that uses [SalesPerCategoryApi] for API calls
/// and [BaseRepository] to centralize error handling.
class SalesPerCategoryRepositoryImpl extends BaseRepository implements SalesPerCategoryRepository {
  final SalesPerCategoryApi _api;

  SalesPerCategoryRepositoryImpl(this._api);

  @override
  Future<ApiResult<List<SalesPerCategory>>> getSalesPerCategory(SalesPerCategoryPayload payload) {
    return call(() async {
      final response = await _api.getSalesPerCategory(payload);
      return response.map((value) => value.toEntity()).toList();
    });
  }
}
