import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/api/sales_per_shift_api.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/repositories/sales_per_shift_repository.dart';

/// Concrete implementation of [SalesPerShiftRepository] that uses [SalesPerShiftApi] for API calls
/// and [BaseRepository] to centralize error handling.
class SalesPerShiftRepositoryImpl extends BaseRepository implements SalesPerShiftRepository {
  final SalesPerShiftApi _api;

  SalesPerShiftRepositoryImpl(this._api);

  @override
  Future<ApiResult<SalesPerShiftDetails>> getSalesPerShiftById(int id) {
    return call(() async {
      final response = await _api.getSalesPerShiftById(id);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<SalesPerShiftPaginatedList>> getSalesPerShift({
    required int page,
    required int size,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    return call(() async {
      final response = await _api.getSalesPerShift(
        page: page,
        size: size,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      );
      return response;
    });
  }
}
